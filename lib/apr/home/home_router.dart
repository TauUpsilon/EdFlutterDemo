import 'package:eyr/apr/app_routes.dart';
import 'package:eyr/featured/home/home_view.dart';
import 'package:eyr/states/auth/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final homeRouter = ShellRoute(
  builder: (context, state, child) => child,
  routes: [
    GoRoute(
      path: '/${AppRoutes.home.path}',
      name: AppRoutes.home.name,
      redirect: (context, state) {
        if (!GetIt.I<AuthCubit>().state.isAuthenticated) {
          return AppRoutes.auth.login.name;
        }

        return null;
      },
      builder: (context, state) => const HomeView(),
    ),
  ],
);
