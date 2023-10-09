part of 'app.widget.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    LoggingService loggingService = GetIt.instance.get<LoggingService>();

    loggingService.i('Will navigate to -> ${settings.name}');

    print(settings);

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomePage(key: UniqueKey()),
        );

      case '/network':
        return MaterialPageRoute(
          builder: (_) => NetworkPage(key: UniqueKey()),
        );

      case '/component':
        return MaterialPageRoute(
          builder: (_) => ComponentPage(key: UniqueKey()),
        );

      default:
        return MaterialPageRoute(builder: (_) => const Text('404'));
    }
  }
}
