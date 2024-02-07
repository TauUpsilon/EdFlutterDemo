import 'package:eyr/apr/app_routes.dart';
import 'package:eyr/featured/network/network_view.dart';
import 'package:go_router/go_router.dart';

final networkRouter = ShellRoute(
  builder: (context, state, child) => child,
  routes: [
    GoRoute(
      path: '/${AppRoutes.network.path}',
      name: AppRoutes.network.name,
      builder: (context, state) => NetworkView(test: 'test'),
    ),
  ],
);
