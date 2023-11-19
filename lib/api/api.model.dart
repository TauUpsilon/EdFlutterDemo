part of 'api.service.dart';

abstract class ApiModel<T> {
  String code;

  ApiModel({
    required this.code,
  });
}

class ApiLoading<T> extends ApiModel<T> {
  ApiLoading() : super(code: '');
}

class ApiDone<T> extends ApiModel<T> {
  T value;

  ApiDone({
    required super.code,
    required this.value,
  });

  @override
  String toString() => StringUtil.formateStrAsJson({
        'Status': 'Success',
        'Return Code': code,
        'Model': runtimeType.toString(),
      });
}

class ApiFail<T> extends ApiModel<T> {
  String message;

  ApiFail({
    required super.code,
    this.message = '',
  });

  @override
  String toString() => StringUtil.formateStrAsJson({
        'Status': 'Failure',
        'Return Code': code,
        'Return Message': StringUtil.splitStrIntoLines(message, 100),
        'Model': runtimeType.toString(),
      });
}
