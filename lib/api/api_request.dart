part of 'api_service.dart';

abstract class ApiRequest with EquatableMixin {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final ApiMethod method;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String uri;

  ApiRequest({
    required this.method,
    required this.uri,
  });

  Uri get reqURI;

  Map<String, String> get reqHeader;

  String? get reqBody;

  Map<String, dynamic> toJson();

  ApiResponse<T> handleResponse<T>(
    Response response,
    T Function(Map<String, dynamic> value) serialiser,
  );

  Future<ApiResponse<T>?> handleError<T>(
    Exception error,
    Future<ApiResponse<T>> Function() tryRequestAgain,
  );

  @override
  String toString() => StringUtil.prettyLog(
        'Request',
        {
          'API': '$reqURI',
          'Method': method.name.toUpperCase(),
          'Header': StringUtil.prettyJson(reqHeader),
          'Body': StringUtil.prettyJson(toJson()),
        },
      );
}
