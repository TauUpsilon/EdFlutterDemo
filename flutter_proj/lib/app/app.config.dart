part of 'app.widget.dart';

class AppConfig {
  static int timeoutSec = int.parse(dotenv.get('TIMEOUT_SEC'));
  static String jsonPlaceholderBaseUrl = dotenv.get('JSON_PLACEHOLDER_BASE_URL');
}
