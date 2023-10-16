part of 'app.widget.dart';

class AppRouteConfig {
  static String home = 'home';
  static String network = 'network';
  static String component = 'component';

  static List<AppRouteEntity> routes = [
    AppRouteEntity(
      name: home,
      page: HomePage(key: UniqueKey()),
      blocs: [BlocProvider.value(value: HomeCubit())],
      subRoutes: [],
    ),
    AppRouteEntity(
      name: network,
      page: NetworkPage(key: UniqueKey()),
      blocs: [BlocProvider.value(value: NetworkCubit())],
      subRoutes: [],
    ),
    AppRouteEntity(
      name: component,
      page: ComponentPage(key: UniqueKey()),
      blocs: [BlocProvider.value(value: NetworkCubit())],
      subRoutes: [],
    ),
  ];

  static List<GoRoute> getGoRoutes(List<AppRouteEntity> routes) {
    return routes
        .map(
          (route) => GoRoute(
            name: route.name,
            path: '/${route.name}',
            builder: (context, state) => MultiBlocProvider(
              providers: [...route.blocs],
              child: route.page,
            ),
            routes: route.subRoutes.isNotEmpty ? getGoRoutes(route.subRoutes) : [],
          ),
        )
        .toList();
  }
}

class AppRouteEntity {
  String name;
  Widget page;
  List<dynamic> blocs;
  List<AppRouteEntity> subRoutes;

  AppRouteEntity({
    required this.name,
    required this.page,
    required this.blocs,
    required this.subRoutes,
  });
}
