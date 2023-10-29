part of 'app.widget.dart';

mixin AppConfig {
  String appTitle = dotenv.get('APP_TITLE');
  String currentENV = dotenv.get('CURRENT_ENV');
  int timeoutSec = int.parse(dotenv.get('TIMEOUT_SEC'));
  String jsonPlaceholderBaseUrl = dotenv.get(
    'JSON_PLACEHOLDER_BASE_URL',
  );
}
