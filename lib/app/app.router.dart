part of 'app.widget.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  late String? initialPath;

  AppRouter({super.navigatorKey});

  @override
  RouteType get defaultRouteType => RouteType.custom(
        durationInMilliseconds: 100,
        reverseDurationInMilliseconds: 100,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return ScaleTransition(
            scale: animation.drive(
              Tween<double>(begin: 0.9, end: 1),
            ),
            child: FadeTransition(
              opacity: animation.drive(
                Tween<double>(begin: 0, end: 1),
              ),
              child: child,
            ),
          );
        },
      );

  @override
  List<AutoRoute> get routes => [
        // RedirectRoute(
        //   path: '/',
        //   redirectTo: initialPath ?? '/home',
        // ),
        AutoRoute(
          initial: true,
          path: '/home',
          page: HomeRoute.page,
          guards: [
            // HomeRouteGuard(),
          ],
        ),
        AutoRoute(
          path: '/network',
          page: NetworkRoute.page,
        ),
        AutoRoute(
          path: '/component',
          page: ComponentRoute.page,
        ),
        AutoRoute(
          path: '/nested',
          page: NestedRouter.page,
          children: [
            AutoRoute(
              initial: true,
              path: 'nested-home',
              page: NestedHomeRoute.page,
            ),
            AutoRoute(
              path: 'nested-one',
              page: NestedOneRoute.page,
            ),
            AutoRoute(
              path: 'nested-two',
              page: NestedTwoRoute.page,
            ),
            AutoRoute(
              path: 'sub-nested',
              page: SubNestedRouter.page,
              children: [
                AutoRoute(
                  initial: true,
                  path: 'sub-nested-home',
                  page: SubNestedHomeRoute.page,
                ),
              ],
            ),
          ],
        ),
      ];
}

class AppRouteObserver extends AutoRouterObserver {}
