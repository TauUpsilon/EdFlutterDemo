part of 'api.service.dart';

class ApiStatusCode {
  /// Offline
  static const String api0001 = 'API0001';

  /// Bad Request (4xx)
  static const String api0004 = 'API0004';

  /// Server Error (5xx)
  static const String api0005 = 'API0005';

  /// Requesting Timeout
  static const String api0006 = 'API0006';

  /// Unknown API Response
  static const String api0007 = 'API0007';

  /// Unknown Error
  static const String api9999 = 'API9999';
}

mixin ApiCommonConst {
  static final apiInstances = _ApiCommonInstances();
  static final apiErrorInstances = _ApiErrorInstances();
}

class _ApiCommonInstances {
  final loading = ApiLoading();
}

class _ApiErrorInstances {
  final offline = ApiFail<Map<String, dynamic>>(
    code: ApiStatusCode.api0001,
    value: {},
    message: 'Check your connectivity',
  );

  final clientIssue = ApiFail<Map<String, dynamic>>(
    code: ApiStatusCode.api0004,
    value: {},
    message: 'System not responsed',
  );

  final serverIssue = ApiFail<Map<String, dynamic>>(
    code: ApiStatusCode.api0005,
    value: {},
    message: 'System not responsed',
  );

  final timeout = ApiFail<Map<String, dynamic>>(
    code: ApiStatusCode.api0006,
    value: {},
    message: 'Timeout',
  );

  final uknownError = ApiFail<Map<String, dynamic>>(
    code: ApiStatusCode.api9999,
    value: {},
    message: 'Something went wrong...',
  );
}
