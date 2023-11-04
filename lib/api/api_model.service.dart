part of 'api.service.dart';

class ApiModelService with Alpha {
  late ApiModel model;

  ApiModel<T> serialise<T>(T Function(dynamic value) callback) {
    var modelCopied = model;

    if (modelCopied is ApiFail) {
      modelCopied = ApiFail<T>(
        code: modelCopied.code,
        value: callback(modelCopied.value),
        message: modelCopied.message,
      );

      logger.e('$runtimeType - ApiModel \n\n$modelCopied');
    } else {
      modelCopied = ApiDone<T>(
        code: modelCopied.code,
        value: callback(modelCopied.value),
      );

      logger.d('$runtimeType - ApiModel \n\n$modelCopied');
    }

    return modelCopied as ApiModel<T>;
  }
}
