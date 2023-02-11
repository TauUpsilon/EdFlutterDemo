import 'package:flutter_proj/core/api_status.enum.dart';

class ApiModel<T> {
  ApiStatusEnum? state;
  String? returnCode;
  T? data;

  ApiModel({
    required this.state,
    required this.returnCode,
    required this.data,
  });
}
