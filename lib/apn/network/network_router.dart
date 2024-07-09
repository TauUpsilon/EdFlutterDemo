import 'package:eyr/apn/app_routes.dart';
import 'package:eyr/featured/network/network_view.dart';
import 'package:eyr/shared/abstracts/route_guard.dart';
import 'package:eyr/shared/guards/auth_guard.dart';
import 'package:go_router/go_router.dart';

final networkRouter = ShellRoute(
  redirect: (context, state) => context.defend(
    guards: [
      AuthGuard.new,
    ],
    state: state,
  ),
  builder: (context, state, child) => child,
  routes: [
    GoRoute(
      path: '/${AppRoutes.network.path}',
      name: AppRoutes.network.name,
      builder: (context, state) => NetworkParam.getView(
        state.extra as Map<String, dynamic>? ?? {},
      ),
    ),
  ],
);
