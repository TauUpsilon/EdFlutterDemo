import 'package:eyr/apn/app/app_routes.dart';
import 'package:eyr/apn/auth/auth_router.dart';
import 'package:eyr/apn/common/common_router.dart';
import 'package:eyr/apn/home/home_router.dart';
import 'package:eyr/app/app_navigator.dart';
import 'package:eyr/states/init/init_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter.routingConfig(
  navigatorKey: AppNavigator.key,
  debugLogDiagnostics: true,
  routingConfig: appRoutingConfig,
);

final appRoutingConfig = ValueNotifier<RoutingConfig>(
  RoutingConfig(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        redirect: (context, state) async {
          await GetIt.I<InitCubit>().prepare();

          return GetIt.I<GoRouter>().pushNamed(
            AppRoutes.home.name,
          );
        },
      ),
      authRouter,
      homeRouter,
      commonRouter,
    ],
  ),
);
