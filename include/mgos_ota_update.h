#ifdef __cplusplus
extern "C"
{
#endif

  esp_err_t mgos_ota_update_app(const char *s);

  esp_err_t mgos_ota_update_fs(const char *s);

  esp_err_t mgos_ota_write(const char *s);

  esp_err_t mgos_ota_config(bool run);

  const char *mgos_ota_get_fw_version();

  const char *mgos_ota_get_fw_name();

  esp_err_t mgos_ota_prepare();

  esp_err_t mgos_ota_prepare_fs();

  const int mgos_get_buffer_size();

  bool mgos_esp_ota_update_init(void);

#ifdef __cplusplus
}
#endif