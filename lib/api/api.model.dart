part of 'api.service.dart';

class ApiModel<T> {
  LoadingStatus status;
  CommonDone<T>? value;
  CommonFail? error;

  ApiModel({
    required this.status,
    this.value,
    this.error,
  }) : super();
}
