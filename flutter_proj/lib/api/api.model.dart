import 'package:flutter_proj/shared/enums/common.status.dart';
import 'package:flutter_proj/shared/objects/common_error.dart';

class ApiModel<T> {
  CommonStatus? status;
  String? returnCode;
  T? data;
  CommonError? error;

  ApiModel({
    required this.status,
    required this.returnCode,
    this.data,
    this.error,
  }) : super();
}
