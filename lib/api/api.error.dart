part of 'api.service.dart';

class ApiException implements Exception {
  final String message;

  ApiException([this.message = '']);

  @override
  String toString() => 'ApiException with $runtimeType: $message';
}

class UnknownResException extends ApiException {
  UnknownResException([super.message]);
}

class ServerException extends ApiException {
  ServerException([super.message]);
}

class ClientException extends ApiException {
  ClientException([super.message]);
}
