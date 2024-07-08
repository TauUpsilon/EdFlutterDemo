import 'package:eyr/apn/app_routes.dart';
import 'package:eyr/apn/auth/auth_router.dart';
import 'package:eyr/apn/home/home_router.dart';
import 'package:eyr/apn/network/network_router.dart';
import 'package:eyr/app/app_navigator.dart';
import 'package:eyr/featured/home/home_view.dart';
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
        redirect: (context, state) => GetIt.I<GoRouter>().pushNamed(
          AppRoutes.home.name,
          extra: HomeParam(
            testone: 'testone',
            testtwo: Test(subtest: 'sub'),
          ).toExtra(),
        ),
      ),
      authRouter,
      homeRouter,
      networkRouter,
    ],
  ),
);
