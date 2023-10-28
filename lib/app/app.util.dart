part of 'app.widget.dart';

mixin AppUtil {
  static Future<void> setEnvironment() async {
    const envStr = String.fromEnvironment('ENV');

    var envPath = 'environments/';

    switch (envStr) {
      case 'STAGE':
        envPath = '${envPath}stage.env';

      case 'PROD':
        envPath = '${envPath}prod.env';

      default:
        envPath = '${envPath}local.env';
        break;
    }

    await dotenv.load(
      fileName: envPath,
    );
  }

  static String getJsonString(dynamic json) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(json);
  }

  static String splitStringIntoLines(String input, int maxLen) {
    final result = StringBuffer();
    var index = 0;

    while (index < input.length) {
      final remainChars = input.length - index;
      final lineLength = remainChars < maxLen ? remainChars : maxLen;
      final line = input.substring(index, index + lineLength);

      result.write(line);

      index += lineLength;

      if (index < input.length) {
        result.write('\n');
      }
    }

    return result.toString();
  }
}
