#include "mgos.h"
#include "mgos_config.h"
#include "mgos_service_config.h"
#include "common/cs_base64.h"
#include "esp_ota_ops.h"
#include "esp_partition.h"

#define DEFAULT_OTA_BUF_SIZE 2048

int config_buffer_size;
int *binary_file_len = 0;
int ota_buf_size;

extern const char *build_version, *build_id;

esp_ota_handle_t update_handle = 0;

const esp_partition_t *update_partition = NULL;
const esp_partition_t *fs_partition = NULL;

const char *mgos_ota_get_fw_version()
{
  return build_version;
}

const char *mgos_ota_get_fw_name()
{
  return MGOS_APP;
}

int mgos_get_buffer_size()
{
  return ota_buf_size;
}

static int b64rev(int c)
{
  if (c >= 'A' && c <= 'Z')
  {
    return c - 'A';
  }
  else if (c >= 'a' && c <= 'z')
  {
    return c + 26 - 'a';
  }
  else if (c >= '0' && c <= '9')
  {
    return c + 52 - '0';
  }
  else if (c == '+')
  {
    return 62;
  }
  else if (c == '/')
  {
    return 63;
  }
  else
  {
    return 64;
  }
}

static int b64dec(const char *src, int n, char *dst)
{
  const char *end = src + n;
  int len = 0;
  while (src + 3 < end)
  {
    int a = b64rev(src[0]), b = b64rev(src[1]), c = b64rev(src[2]),
        d = b64rev(src[3]);
    dst[len++] = (a << 2) | (b >> 4);
    if (src[2] != '=')
    {
      dst[len++] = (b << 4) | (c >> 2);
      if (src[3] != '=')
      {
        dst[len++] = (c << 6) | d;
      }
    }
    src += 4;
  }
  return len;
}

esp_err_t mgos_ota_prepare()
{
  LOG(LL_INFO, ("Starting OTA..."));
  update_partition = esp_ota_get_next_update_partition(NULL);
  if (update_partition == NULL)
  {
    LOG(LL_ERROR, ("Passive OTA (app) partition not found"));
    return ESP_FAIL;
  }
  LOG(LL_INFO, ("Writing to partition %s: subtype %d at offset 0x%x",
                update_partition->label, update_partition->subtype, update_partition->address));

  esp_err_t err = esp_ota_begin(update_partition, OTA_SIZE_UNKNOWN, &update_handle);
  if (err != ESP_OK)
  {
    LOG(LL_ERROR, ("esp_ota_begin (app) failed, error=%d", err));
    return err;
  }
  LOG(LL_INFO, ("esp_ota_begin (app) success"));

  return ESP_OK;
}

esp_err_t mgos_ota_prepare_fs(){
    if (update_partition == NULL)
    {
      return ESP_ERR_INVALID_STATE;
    }
    char fs_label[6];
    char fs_id[2];
    strcpy(fs_label, "fs_");
    strcpy(fs_id, &update_partition->label[strlen(update_partition->label) - 1]);
    strcat(fs_label, fs_id);
    fs_partition = esp_partition_find_first(ESP_PARTITION_TYPE_DATA, ESP_PARTITION_SUBTYPE_DATA_SPIFFS, fs_label);
    if (fs_partition == NULL)
    {
      LOG(LL_ERROR, ("Passive OTA (fs) partition not found"));
      return ESP_FAIL;
    }
  LOG(LL_INFO, ("Writing to partition %s: subtype %d at offset 0x%x",
                fs_partition->label, fs_partition->subtype, fs_partition->address));
  esp_err_t err = esp_ota_begin(fs_partition, OTA_SIZE_UNKNOWN, &update_handle);
  if (err != ESP_OK)
  {
    LOG(LL_ERROR, ("esp_ota_begin (fs) failed, error=%d", err));
    return err;
  }
  LOG(LL_INFO, ("esp_ota_begin (fs) success"));

  return ESP_OK;
}

esp_err_t mgos_ota_write(const char *s)
{
  esp_err_t ota_write_err = ESP_OK;
  if (strlen(s) > 0)
  {
    const int alloc_size = ota_buf_size;
    char *upgrade_data_buf = (char *)malloc(alloc_size);
    if (!upgrade_data_buf)
    {
      LOG(LL_ERROR, ("Couldn't allocate memory to upgrade data buffer"));
      return ESP_ERR_NO_MEM;
    }
    b64dec(s, strlen(s), upgrade_data_buf);

    ota_write_err = esp_ota_write(update_handle, (const void *)upgrade_data_buf, ota_buf_size);
    if (ota_write_err != ESP_OK)
    {
      LOG(LL_ERROR, ("esp_ota_write error! err=0x%d", ota_write_err));
      return ota_write_err;
    }
    free(upgrade_data_buf);
  }
  if (strlen(s) == 0)
  {
  }
  LOG(LL_INFO, ("mgos_ota_run says %d", ota_write_err));
  return ota_write_err;
}

esp_err_t mgos_ota_update_app(const char *s)
{
  esp_err_t ota_write_err = ESP_OK;
  if (update_partition == NULL)
  {
    return ESP_ERR_INVALID_STATE;
  }
  if (strlen(s) > 0)
  {
    return mgos_ota_write(s);
  }
  if (strlen(s) == 0)
  {
    LOG(LL_INFO, ("All data received"));
    ota_write_err = esp_ota_end(update_handle);
    if (ota_write_err != ESP_OK)
    {
      LOG(LL_ERROR, ("esp_ota_end (fs) error! err=0x%d", ota_write_err));
      return ota_write_err;
    }
    else
    {
      return 999; // App complete, need file system
    }
  }
  return ESP_FAIL;
}

esp_err_t mgos_ota_update_fs(const char *s)
{
  esp_err_t ota_write_err = ESP_OK;
  if (fs_partition == NULL)
  {
    return ESP_ERR_INVALID_STATE;
  }
  if (strlen(s) > 0)
  {
    return mgos_ota_write(s);
  }
  if (strlen(s) == 0)
  {
    LOG(LL_INFO, ("All data received"));
    ota_write_err = esp_ota_end(update_handle);
    if (ota_write_err != ESP_OK)
    {
      LOG(LL_ERROR, ("esp_ota_end (fs) error! err=0x%d", ota_write_err));
      return ota_write_err;
    }
    else
    {
      return 888; // FS complete
    }
  }
  return ESP_FAIL;
}

esp_err_t mgos_ota_update_complete()
{
  esp_err_t ota_complete_err = ESP_OK;
  ota_complete_err = esp_ota_set_boot_partition(update_partition);
  if (ota_complete_err != ESP_OK)
  {
    LOG(LL_ERROR, ("esp_ota_set_boot_partition failed! err=0x%d", ota_complete_err));
    return ota_complete_err;
  }
  LOG(LL_INFO, ("esp_ota_set_boot_partition succeeded"));
  return ESP_OK;
}

bool mgos_esp_ota_update_init(void){
  LOG(LL_INFO, ("ESP OTA Update core init"));
  mgos_rpc_service_config_init();
  config_buffer_size = mgos_sys_config_get_ota_buffer_size();
  int ota_buf_size = (config_buffer_size > 0) ? config_buffer_size : DEFAULT_OTA_BUF_SIZE;
  return true;
}