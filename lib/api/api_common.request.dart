part of 'api.service.dart';

class JsonPlaceholderRequest extends ApiRequest {
  JsonPlaceholderRequest({
    required super.method,
    required super.uri,
    super.body,
  });

  @override
  Uri get reqURI {
    return Uri.parse(
      '${AppConfig.jsonPlaceholderBaseUrl}/$uri',
    ).replace(
      queryParameters: body,
    );
  }

  @override
  String? get reqBody {
    return jsonEncode(body);
  }

  @override
  Map<String, String> get reqHeader {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
  }
}
