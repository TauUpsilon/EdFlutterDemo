part of 'app.widget.dart';

class AppUtil {
  static Future<void> setEnvironment() async {
    const envStr = String.fromEnvironment('ENV');

    var envPath = 'environments/';

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
    var encoder = const JsonEncoder.withIndent("  ");
    return encoder.convert(json);
  }
}
