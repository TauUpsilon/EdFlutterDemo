part of 'api.service.dart';

class ApiModel<T> {
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
}

class ApiFail<T> extends ApiModel<T> {
  String message;

  ApiFail({
    required super.code,
    required super.value,
    this.message = '',
  });
}
