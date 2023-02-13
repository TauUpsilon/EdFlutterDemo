import 'package:flutter_proj/shared/enums/common.status.dart';
import 'package:flutter_proj/shared/objects/common_done.dart';
import 'package:flutter_proj/shared/objects/common_fail.dart';

class ApiModel<T> {
  CommonStatus status;
  CommonDone? value;
  CommonFail? error;

  ApiModel({
    required this.status,
    this.value,
    this.error,
  }) : super();
}
