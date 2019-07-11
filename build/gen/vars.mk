APP=esp_ota_update
APP_BIN_LIBS=
APP_CFLAGS=-DLFS_NO_DEBUG=1 -DMBEDTLS_ECP_ATCA=1 -DMBEDTLS_FREE_CERT_CHAIN=1 -DMBEDTLS_USER_CONFIG_FILE=\"mbedtls_platform_config.h\" -DMBEDTLS_X509_CA_CHAIN_ON_DISK=1 -DMGOS=1 -DMGOS_ENABLE_RPC_CHANNEL_HTTP=1 -DMGOS_ENABLE_SYS_SERVICE=1 -DMGOS_HAVE_ATCA=1 -DMGOS_HAVE_CORE=1 -DMGOS_HAVE_FREERTOS=1 -DMGOS_HAVE_I2C=1 -DMGOS_HAVE_MBEDTLS=1 -DMGOS_HAVE_MONGOOSE=1 -DMGOS_HAVE_RPC_COMMON=1 -DMGOS_HAVE_RPC_SERVICE_CONFIG=1 -DMGOS_HAVE_VFS_COMMON=1 -DMGOS_HAVE_VFS_FS_LFS=1 -DMGOS_HAVE_VFS_FS_SPIFFS=1 -DMGOS_LFS1_COMPAT=0 -DMG_ENABLE_DNS=1 -DMG_ENABLE_DNS_SERVER=1 -DMG_ENABLE_MQTT=1 -DMG_ENABLE_SNTP=1 -DMG_ENABLE_SSL=1 -DMG_SSL_IF=MG_SSL_IF_MBEDTLS -DMG_SSL_IF_MBEDTLS_FREE_CERTS=1
APP_CONF_SCHEMA=/data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/build/gen/mos_conf_schema.yml
APP_CXXFLAGS=-DLFS_NO_DEBUG=1 -DMBEDTLS_ECP_ATCA=1 -DMBEDTLS_FREE_CERT_CHAIN=1 -DMBEDTLS_USER_CONFIG_FILE=\"mbedtls_platform_config.h\" -DMBEDTLS_X509_CA_CHAIN_ON_DISK=1 -DMGOS=1 -DMGOS_ENABLE_RPC_CHANNEL_HTTP=1 -DMGOS_ENABLE_SYS_SERVICE=1 -DMGOS_HAVE_ATCA=1 -DMGOS_HAVE_CORE=1 -DMGOS_HAVE_FREERTOS=1 -DMGOS_HAVE_I2C=1 -DMGOS_HAVE_MBEDTLS=1 -DMGOS_HAVE_MONGOOSE=1 -DMGOS_HAVE_RPC_COMMON=1 -DMGOS_HAVE_RPC_SERVICE_CONFIG=1 -DMGOS_HAVE_VFS_COMMON=1 -DMGOS_HAVE_VFS_FS_LFS=1 -DMGOS_HAVE_VFS_FS_SPIFFS=1 -DMGOS_LFS1_COMPAT=0 -DMG_ENABLE_DNS=1 -DMG_ENABLE_DNS_SERVER=1 -DMG_ENABLE_MQTT=1 -DMG_ENABLE_SNTP=1 -DMG_ENABLE_SSL=1 -DMG_SSL_IF=MG_SSL_IF_MBEDTLS -DMG_SSL_IF_MBEDTLS_FREE_CERTS=1
APP_FS_FILES=
APP_INCLUDES=/data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/freertos/include /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/freertos/include/esp32 /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/i2c/include /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/atca/include /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/atca/cryptoauthlib/lib /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/mbedtls/include /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/mbedtls/include/esp32 /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/mbedtls/mbedtls/include /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/vfs-common/include /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/vfs-common/include/esp32 /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/mongoose/include /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/vfs-fs-lfs/include /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/vfs-fs-lfs/littlefs /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/vfs-fs-lfs/littlefs1 /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/vfs-fs-spiffs/include /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/vfs-fs-spiffs/include/spiffs /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/vfs-fs-spiffs/include/esp32 /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/core/include /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/core/include/esp32 /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/rpc-common/include /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/rpc-service-config/include /data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/include
APP_SOURCES=/data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/src/mgos_ota_update.c
APP_VERSION=1.0
BOARD=
BUILD_DIR=/data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/build/objs
ESP_IDF_EXTRA_COMPONENTS=
ESP_IDF_SDKCONFIG_OPTS= CONFIG_SUPPORT_STATIC_ALLOCATION=y 
FFI_SYMBOLS=
FS_STAGING_DIR=/data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/build/fs
FW_DIR=/data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/build/fw
GEN_DIR=/data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/build/gen
MANIFEST_FINAL=/data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/build/gen/mos_final.yml
MGOS=1
MGOS_HAVE_ATCA=1
MGOS_HAVE_CORE=1
MGOS_HAVE_FREERTOS=1
MGOS_HAVE_I2C=1
MGOS_HAVE_MBEDTLS=1
MGOS_HAVE_MONGOOSE=1
MGOS_HAVE_RPC_COMMON=1
MGOS_HAVE_RPC_SERVICE_CONFIG=1
MGOS_HAVE_VFS_COMMON=1
MGOS_HAVE_VFS_FS_LFS=1
MGOS_HAVE_VFS_FS_SPIFFS=1
MGOS_PATH=/data/fwbuild-volumes/2.14.0/apps/esp_ota_update/esp32/build_contexts/build_ctx_259379228/deps/modules/mongoose-os
PLATFORM=esp32