part of 'api_service.dart';

class ApiException implements Exception {
  final String? status;
  final String? from;
  final String? reason;

  ApiException(this.status, [this.from, this.reason]);

  @override
  String toString() => StringUtil.prettyLog(
        'Error -> ApiException',
        {
          'Status': status,
          'From': from,
          'Reason': reason,
        },
      );
}

class ServerException extends ApiException {
  ServerException(super.status, [super.from, super.reason]);
}

class ClientException extends ApiException {
  ClientException(super.status, [super.from, super.reason]);
}

class UnknownException extends ApiException {
  UnknownException(super.status, [super.from, super.reason]);
}
