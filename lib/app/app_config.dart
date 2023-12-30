part of 'app_widget.dart';

class AppConfig {
  String test = '';

  static const String appTitle =
      String.fromEnvironment('APP_TITLE', defaultValue: 'App');
  static const String currentENV = String.fromEnvironment('CURRENT_ENV');
  static const int timeoutSec = int.fromEnvironment(
    'TIMEOUT_SEC',
    defaultValue: 1,
  );
  static const String jsonPlaceholderBaseUrl = String.fromEnvironment(
    'JSON_PLACEHOLDER_BASE_URL',
  );

  static Future<void> loadEnv() async {
    // const envStr = String.fromEnvironment('ENV');
  }
}
