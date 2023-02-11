import 'package:flutter_proj/shared/enums/common.status.dart';

class CommonResult<T> {
  CommonStatus? status;
  String? returnCode;
  T? data;

  CommonResult({
    required this.status,
    required this.returnCode,
    required this.data,
  });
}
