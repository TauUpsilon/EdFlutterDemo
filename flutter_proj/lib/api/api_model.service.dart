import 'package:flutter_proj/api/api.model.dart';
import 'package:flutter_proj/core/app.service.dart';
import 'package:flutter_proj/shared/objects/common_done.dart';
import 'package:flutter_proj/shared/objects/common_fail.dart';

class ApiModelService extends AppService {
  late Map<String, dynamic> _model;

  set model(Map<String, dynamic> res) {
    _model = res;
  }

  ApiModel<T> serialise<T>(T Function(Map<String, dynamic> value) callback) {
    return ApiModel<T>(
      status: _model["status"],
      value: _model['value'] != null
          ? CommonDone<T>(
              code: _model['value']['code'],
              data: callback(_model['value']['data']),
            )
          : null,
      error: _model["error"] != null
          ? CommonFail(
              code: _model["error"]["code"],
              message: _model["error"]["message"],
            )
          : null,
    );
  }
}
