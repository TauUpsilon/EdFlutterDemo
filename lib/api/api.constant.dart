part of 'api.service.dart';

class ApiStatusCode {
  /// 網路無連線
  static const String api0001 = 'API0001';

  /// 非合法詢問(4xx)
  static const String api0004 = 'API0004';

  /// 伺服器錯誤(5xx)
  static const String api0005 = 'API0005';

  /// 伺服器 Timeout
  static const String api0006 = 'API0006';

  /// 未知的 API 回應
  static const String api0007 = 'API0007';
}

class ApiCommonInstance {
  static final loading = {
    'status': LoadingStatus.loading,
    'value': null,
    'error': null,
  };
}

class ApiErrorInstance {
  static final offline = {
    'status': LoadingStatus.loaded,
    'value': null,
    'error': {
      'code': ApiStatusCode.api0001,
      'message': 'Check your connectivity',
    }
  };

  static final clientIssue = {
    'status': LoadingStatus.loaded,
    'value': null,
    'error': {
      'code': ApiStatusCode.api0004,
      'message': 'System not responsed',
    }
  };

  static final serverIssue = {
    'status': LoadingStatus.loaded,
    'value': null,
    'error': {
      'code': ApiStatusCode.api0005,
      'message': 'System not responsed',
    }
  };

  static final timeout = {
    'status': LoadingStatus.loaded,
    'value': null,
    'error': {
      'code': ApiStatusCode.api0006,
      'message': 'Timeout',
    }
  };
}
