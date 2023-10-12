part of 'app.widget.dart';

class AppConfig {
  static String appTitle = dotenv.get('APP_TITLE');
  static String currentENV = dotenv.get('CURRENT_ENV');
  static int timeoutSec = int.parse(dotenv.get('TIMEOUT_SEC'));
  static String jsonPlaceholderBaseUrl = dotenv.get('JSON_PLACEHOLDER_BASE_URL');
}
