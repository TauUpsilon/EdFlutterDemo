part of 'api.service.dart';

class ApiModeller with CommonFunctionable {
  late dynamic model;

  ApiModeller({
    required this.model,
  });

  ApiModel<T> serialise<T>(T Function(dynamic value) callback) {
    var modelCopied = model;

    if (modelCopied is ApiFail) {
      modelCopied = ApiFail<T>(
        code: modelCopied.code,
        message: modelCopied.message,
      );

      logger.e('$runtimeType - ApiModel \n\n$modelCopied');
    } else if (modelCopied is ApiDone) {
      modelCopied = ApiDone<T>(
        code: modelCopied.code,
        value: callback(modelCopied.value),
      );

      logger.d('$runtimeType - ApiModel \n\n$modelCopied');
    }

    return modelCopied;
  }
}
