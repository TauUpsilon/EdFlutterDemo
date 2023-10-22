part of 'api.service.dart';

class ApiModelService extends AlphaBase {
  late ApiModel _model;

  set model(ApiModel res) {
    _model = res;
  }

  ApiModel<T> serialise<T>(T Function(dynamic value) callback) {
    var model = _model;

    if (model is ApiFail) {
      return ApiFail<T>(
        code: model.code,
        value: callback(model.value),
        message: model.message,
      );
    } else {
      return ApiDone<T>(
        code: model.code,
        value: callback(_model.value),
      );
    }
  }
}
