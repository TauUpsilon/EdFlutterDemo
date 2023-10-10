part of 'api.service.dart';

class ApiModelService extends AlphaBase {
  late Map<String, dynamic> _model;

  set model(Map<String, dynamic> res) {
    _model = res;
  }

  ApiModel<T> serialise<T>(T Function(dynamic value) callback) {
    return ApiModel<T>(
      status: _model['status'],
      value: _model['value'] != null
          ? CommonDone<T>(
              code: _model['value']['code'],
              data: callback(_model['value']['data']),
            )
          : null,
      error: _model['error'] != null
          ? CommonFail(
              code: _model['error']['code'],
              message: _model['error']['message'],
            )
          : null,
    );
  }
}
