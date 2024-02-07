import 'package:eyr/apr/app_routes.dart';
import 'package:eyr/featured/auth/login/login_view.dart';
import 'package:eyr/featured/network/network_view.dart';
import 'package:eyr/states/auth/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final networkRouter = ShellRoute(
  builder: (context, state, child) => child,
  routes: [
    GoRoute(
      path: '/${AppRoutes.network.path}',
      name: AppRoutes.network.name,
      redirect: (context, state) async {
        if (!GetIt.I<AuthCubit>().state.isAuthenticated) {
          await GetIt.I<GoRouter>().pushNamed(
            AppRoutes.auth.login.name,
            extra: LoginRouteParam(redirectUrl: state.uri),
          );

          return null;
        }

        return null;
      },
      builder: (context, state) => NetworkView(test: 'test'),
    ),
  ],
);
