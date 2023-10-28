part of 'api.service.dart';

class JsonPlaceholderRequest extends ApiRequest {
  JsonPlaceholderRequest({
    required super.reqMethod,
    required super.reqApi,
    super.reqBody,
  }) : super(
          reqHeaders: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
        );
}
