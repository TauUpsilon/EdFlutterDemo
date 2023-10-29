part of 'app.widget.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/home',
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: '/network',
          page: NetworkRoute.page,
        ),
        AutoRoute(
          path: '/component',
          page: ComponentRoute.page,
        ),
      ];
}

class AppRouteObserver extends AutoRouterObserver with RouterActions {
  @override
  void didPush(Route route, Route? previousRoute) {
    updateRouterState(route, previousRoute);

    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (previousRoute != null) {
      updateRouterState(previousRoute, route);
    } else {
      updateRouterState(route, previousRoute);
    }

    super.didPop(route, previousRoute);
  }
}
