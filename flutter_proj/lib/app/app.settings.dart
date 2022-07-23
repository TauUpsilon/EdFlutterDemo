
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppSettings{
  static Future<void> setEnvironment() async {
    const envStr = String.fromEnvironment('ENV');

    var envPath = 'environments/';

    switch (envStr) {
      case 'DEV':
        envPath = '${envPath}dev.env';
        break;

      case 'PROD':
        envPath = '${envPath}prod.env';
        break;

      default:
        envPath = '${envPath}default.env';
        break;
    }

    await dotenv.load(
      fileName: envPath,
    );
  }
}
