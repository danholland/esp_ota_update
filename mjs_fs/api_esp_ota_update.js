let OTAUpdate = {
    //_run: ffi('void mgos_ota_config(bool)'),
    _getFwVersion: ffi('char* mgos_ota_get_fw_version()'),
    _getFwName: ffi('char* mgos_ota_get_fw_name()'),
    _getBufferSize: ffi('int mgos_get_buffer_size()'),
    _isReady: ffi('int mgos_ota_prepare()'),
    _isReadyFs: ffi('int mgos_ota_prepare_fs()'),
    _putAppData: ffi('int mgos_ota_update_app(char*)'),
    _putFsData: ffi('int mgos_ota_update_fs(char*)'),
    _proto: {
      // run: function() {
      //   OTAUpdate._run(true);
      // },
      getFwVersion: function() {
        return OTAUpdate._getFwVersion();
      },
      getFwName: function() {
        return OTAUpdate._getFwName();
      },
      getBufferSize: function() {
        return OTAUpdate._getBufferSize();
      },
      isReady: function(type) {
        if(type === 'app'){
        return OTAUpdate._isReady();
        } else if(type === 'fs'){
          return OTAUpdate._isReadyFs();
        }
        return false;
      },
      putData: function(data, type) {
        if (type === 'app') {
          return OTAUpdate._putAppData(data);
        } else if (type === 'fs') {
          return OTAUpdate._putFsData(data);
        }
        return false;
      }
    },
    create: function() {
      let obj = null;
      obj = Object.create(OTAUpdate._proto);
      return obj;
    }
  };
  