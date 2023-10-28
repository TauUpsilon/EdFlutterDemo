part of 'app.widget.dart';

class AppUtil {
  static Future<void> setEnvironment() async {
    const envStr = String.fromEnvironment('ENV');

    String envPath = 'environments/';

    switch (envStr) {
      case 'STAGE':
        envPath = '${envPath}stage.env';
        break;

      case 'PROD':
        envPath = '${envPath}prod.env';
        break;

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

  static String splitStringIntoLines(String input, int maxLineLength) {
    final result = StringBuffer();
    int index = 0;

    while (index < input.length) {
      final remainingChars = input.length - index;
      final lineLength = (remainingChars < maxLineLength) ? remainingChars : maxLineLength;
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
