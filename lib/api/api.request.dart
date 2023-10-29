part of 'api.service.dart';

abstract class ApiRequest with AppUtil {
  final ApiMethod reqMethod;
  final String reqApi;
  final Map<String, String>? reqHeaders;
  final Map<String, dynamic>? reqBody;

  ApiRequest({
    required this.reqMethod,
    required this.reqApi,
    this.reqHeaders,
    this.reqBody,
  });

  @override
  String toString() => getJsonString({
        'Request Method': reqMethod.name,
        'Request API': reqApi,
      });
}
