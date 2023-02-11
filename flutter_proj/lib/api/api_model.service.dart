import 'package:flutter_proj/api/api.model.dart';
import 'package:flutter_proj/core/app.service.dart';

class ApiModelService extends AppService {
  late Map<String, dynamic> _model;

  set model(Map<String, dynamic> res) {
    _model = res;
  }

  ApiModel<T> serialise<T>(T? Function(Map<String, dynamic>? value) callback) {
    return ApiModel<T>(
      status: _model["status"],
      returnCode: _model["returnCode"],
      data: callback(_model["data"]),
      error: _model["error"],
    );
  }
}
