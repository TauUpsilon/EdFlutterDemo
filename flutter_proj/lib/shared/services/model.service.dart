import 'package:flutter_proj/core/app.service.dart';

class ModelService extends AppService {
  late Map<String, dynamic> _model;

  set model(Map<String, dynamic> res) {
    _model = res;
  }

  T serialise<T>(T Function(Map<String, dynamic> value) callback) {
    return callback(_model);
  }
}
