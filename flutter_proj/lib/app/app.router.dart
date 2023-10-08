part of 'app.widget.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    LoggingService loggingService = GetIt.instance.get<LoggingService>();

    final args = settings.arguments;
    loggingService.i('Will navigate to -> ${settings.name}');

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomePage(key: UniqueKey()),
        );
      default:
        return MaterialPageRoute(builder: (_) => const Text('404'));
    }
  }
}
