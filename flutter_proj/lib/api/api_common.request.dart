part of 'api.service.dart';

class JsonPlaceholderRequest extends ApiRequest {
  String apiId;
  Map<String, dynamic>? body;

  JsonPlaceholderRequest({
    required this.apiId,
    body,
  }) {
    method = ApiMethod.get;
  }
}
