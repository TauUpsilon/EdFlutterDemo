part of 'api.service.dart';

class ApiModelService extends AlphaBase {
  late ApiModel _model;

  set model(ApiModel res) {
    _model = res;
  }

  ApiModel<T> serialise<T>(T Function(dynamic value) callback) {
    ApiModel<dynamic> model = _model;

    if (model is ApiFail) {
      model = ApiFail<T>(
        code: model.code,
        value: callback(model.value),
        message: model.message,
      );

      logger.e('$runtimeType - ApiModel \n\n$model');
    } else {
      model = ApiDone<T>(
        code: model.code,
        value: callback(_model.value),
      );

      logger.d('$runtimeType - ApiModel \n\n$model');
    }

    return model as ApiModel<T>;
  }
}
