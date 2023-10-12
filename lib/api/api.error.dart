part of 'api.service.dart';

class UnknownResponseError extends FormatException {
  UnknownResponseError([String message = '']) : super(message);
}

class ServerError extends FormatException {
  ServerError([String message = '']) : super(message);
}

class ClientError extends FormatException {
  ClientError([String message = '']) : super(message);
}
