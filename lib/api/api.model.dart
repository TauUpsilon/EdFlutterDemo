part of 'api.service.dart';

class ApiModel<T> with AppUtil {
  String code;
  T value;

  ApiModel({
    required this.code,
    required this.value,
  });
}

class ApiLoading extends ApiModel {
  ApiLoading() : super(code: '', value: {});
}

class ApiDone<T> extends ApiModel<T> {
  ApiDone({
    required super.code,
    required super.value,
  });

  @override
  String toString() => getJsonString({
        'Status': 'Success',
        'Return Code': code,
        'Model': runtimeType.toString(),
      });
}

class ApiFail<T> extends ApiModel<T> {
  String message;

  ApiFail({
    required super.code,
    required super.value,
    this.message = '',
  });

  @override
  String toString() => getJsonString({
        'Status': 'Failure',
        'Return Code': code,
        'Return Message': splitStringIntoLines(message, 100),
        'Model': runtimeType.toString(),
      });
}
