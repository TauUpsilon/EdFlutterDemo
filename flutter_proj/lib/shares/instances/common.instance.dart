import 'package:flutter_proj/shares/enums/common.enum.dart';

class CommonDone<T> {
  String code;
  T? data;

  CommonDone({
    required this.code,
    required this.data,
  });
}

class CommonFail {
  String code;
  String message;

  CommonFail({
    required this.code,
    required this.message,
  });
}

class CommonResult<T> {
  LoadingStatus? status;
  String? returnCode;
  T? data;

  CommonResult({
    required this.status,
    required this.returnCode,
    required this.data,
  });
}
