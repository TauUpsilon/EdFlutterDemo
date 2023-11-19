part of 'api.service.dart';

abstract class ApiRequest {
  final ApiMethod method;
  final String uri;
  final Map<String, dynamic>? body;

  ApiRequest({
    required this.method,
    required this.uri,
    this.body,
  });

  Uri get reqURI;

  Map<String, String> get reqHeader;

  String? get reqBody;

  @override
  String toString() => StringUtil.formateStrAsJson({
        'Request Method': method.name,
        'Request API': uri,
      });
}
