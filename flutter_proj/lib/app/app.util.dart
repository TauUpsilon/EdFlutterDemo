import 'package:flutter_dotenv/flutter_dotenv.dart';

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
        envPath = '${envPath}dev.env';
        break;
    }

    await dotenv.load(
      fileName: envPath,
    );
  }
}
