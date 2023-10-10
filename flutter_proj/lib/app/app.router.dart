part of 'app.widget.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var loggingService = GetIt.instance.get<LoggingService>();

    loggingService.i('Will navigate to -> ${settings.name}');

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomePage(key: UniqueKey()),
          settings: settings,
        );

      case '/network':
        return MaterialPageRoute(
          builder: (_) => NetworkPage(key: UniqueKey()),
          settings: settings,
        );

      case '/component':
        return MaterialPageRoute(
          builder: (_) => ComponentPage(key: UniqueKey()),
          settings: settings,
        );

      default:
        return MaterialPageRoute(builder: (_) => const Text('404'));
    }
  }
}

class AppRouteObserver extends RouteObserver with AlphaCore {
  @override
  void didPush(Route route, Route? previousRoute) {
    globalStore.dispatch(
      RouterReduxAction.updateRouterStateAction(route, previousRoute),
    );
  }

  // @override
  // void didPop(Route route, Route? previousRoute) { }
}
