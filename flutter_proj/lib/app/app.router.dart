part of 'app.widget.dart';

class AppRouter {
  static GoRouter goRouter = GoRouter(
    initialLocation: '/home',
    routes: AppRouteConfig.getGoRoutes(AppRouteConfig.routes),
    observers: [AppRouteObserver()],
    errorBuilder: (context, state) => const Text('404'),
  );

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var loggingService = GetIt.instance.get<LoggingService>();

    loggingService.i('Will navigate to -> ${settings.name}');

    try {
      var route = AppRouteConfig.routes.firstWhere((route) => route.name == settings.name);

      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [route.bloc],
          child: route.page,
        ),
        settings: settings,
      );
    } on Error catch (_) {
      return MaterialPageRoute(
        builder: (_) => const Text('404'),
        settings: settings,
      );
    }
  }
}

class AppRouteObserver extends RouteObserver with AlphaBase {
  // @override
  // void didPush(Route route, Route? previousRoute) {
  //   globalStore.dispatch(
  //     RouterAction.updateRouterStateAction(route, previousRoute),
  //   );

  //   super.didPush(route, previousRoute);
  // }

  // @override
  // void didPop(Route route, Route? previousRoute) {
  //   if (previousRoute != null) {
  //     globalStore.dispatch(
  //       RouterAction.updateRouterStateAction(previousRoute, route),
  //     );
  //   } else {
  //     globalStore.dispatch(
  //       RouterAction.updateRouterStateAction(route, previousRoute),
  //     );
  //   }

  //   super.didPop(route, previousRoute);
  // }
}
