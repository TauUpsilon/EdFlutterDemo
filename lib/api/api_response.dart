part of 'api_service.dart';

abstract class ApiResponse<T> {
  Uri uri;
  String status;
  T data;

  ApiResponse({
    required this.uri,
    required this.status,
    required this.data,
  });

  @override
  String toString() => StringUtil.prettyLog(
        'Response',
        {
          'From': '$uri',
          'Status': status,
          'Data': StringUtil.prettyJson(data),
        },
      );
}
