class ApiRequestBodyHeader {
  String channelCode = 'MB';
  String deviceBrand = '';
  String deviceType = '';
  String deviceUuid = '';
  String deviceVersion = '';
  String hostTxSn = '';
  String macValue = '';
  String mbAppVersion = '';
  String returnCode = '';
  String returnMessage = '';
  String sessionId = '';
  String txId = '';
  String txSn = '';
  String userIp = '';

  Map<String, dynamic> toJson() => {
        "CHANNEL_CODE": channelCode,
        "DEVICE_BRAND": deviceBrand,
        "DEVICE_TYPE": deviceType,
        "DEVICE_UUID": deviceUuid,
        "DEVICE_VERSION": deviceVersion,
        "HOST_TX_SN": hostTxSn,
        "MAC_VALUE": macValue,
        "MB_APP_VERSION": mbAppVersion,
        "RETURN_CODE": returnCode,
        "RETURN_MESSAGE": returnMessage,
        "SESSION_ID": sessionId,
        "TX_ID": txId,
        "TX_SN": txSn,
        "USER_IP": userIp,
      };
}

abstract class ApiRequest {
  String method = 'GET';
  ApiRequestBodyHeader header = ApiRequestBodyHeader();
  Map<String, dynamic> body = {};

  Map<String, dynamic> toJson() => {
        "HEADER": header,
        "BODY": body,
      };
}
