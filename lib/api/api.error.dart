part of 'api.service.dart';

class UnknownResponseError extends FormatException {
  UnknownResponseError([super.message]);
}

class ServerError extends FormatException {
  ServerError([super.message]);
}

class ClientError extends FormatException {
  ClientError([super.message]);
}
