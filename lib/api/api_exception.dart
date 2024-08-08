part of 'api_service.dart';

class ApiException implements Exception {
  final String? status;
  final String? from;
  final Response? response;

  ApiException({
    this.status,
    this.from,
    this.response,
  });

  @override
  String toString() => StringUtil.prettyLog(
        'Error -> $runtimeType',
        {
          'Status': status,
          'From': from,
          'Reason': response?.reasonPhrase,
        },
      );
}

class ServerException extends ApiException {
  ServerException({super.status, super.from, super.response});
}

class ClientException extends ApiException {
  ClientException({super.status, super.from, super.response});
}

class CryptoExpiredException extends ApiException {
  CryptoExpiredException({super.status, super.from, super.response});
}

class UnknownException extends ApiException {
  UnknownException({super.status, super.from, super.response});
}
