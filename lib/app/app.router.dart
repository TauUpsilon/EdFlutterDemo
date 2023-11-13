part of 'app.widget.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter with CommonFunctionable {
  AppRouter({super.navigatorKey});

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

class AppRouteObserver extends AutoRouterObserver {}
