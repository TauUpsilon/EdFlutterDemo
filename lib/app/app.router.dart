part of 'app.widget.dart';

@RouterGeneratable()
mixin AppRouter {
  static final routeConfig = AppRoute();

  static final goRouter = GoRouter(
    initialLocation: '/${AppRoute.home}',
    routes: [
      GoRoute(
        name: AppRoute.home,
        path: '/${AppRoute.home}',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: HomeCubit()),
          ],
          child: const HomePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.network,
        path: '/${AppRoute.network}',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: NetworkCubit()),
          ],
          child: const NetworkPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.component,
        path: '/${AppRoute.component}',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: NetworkCubit()),
          ],
          child: const ComponentPage(),
        ),
      ),
    ],
    observers: [AppRouteObserver()],
    errorBuilder: (context, state) => const Text('404'),
  );

  // static Route<dynamic> generateRoute(RouteSettings settings) {
  //   var loggingService = GetIt.instance.get<LoggingService>();

  //   loggingService.i('Will navigate to -> ${settings.name}');

  //   try {
  // ignore: lines_longer_than_80_chars
  //     var route = AppRouteConfig.routes.firstWhere((route) => route.name == settings.name);

  //     return MaterialPageRoute(
  //       builder: (_) => MultiBlocProvider(
  //         providers: [...route.blocs],
  //         child: route.page,
  //       ),
  //       settings: settings,
  //     );
  //   } on Error catch (_) {
  //     return MaterialPageRoute(
  //       builder: (_) => const Text('404'),
  //       settings: settings,
  //     );
  //   }
  // }
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
