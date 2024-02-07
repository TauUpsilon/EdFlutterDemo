import 'package:eyr/app/app_navigator.dart';
import 'package:eyr/apr/app_routes.dart';
import 'package:eyr/apr/home/home_router.dart';
import 'package:eyr/apr/network/network_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter.routingConfig(
  navigatorKey: AppNavigator.rootKey,
  debugLogDiagnostics: true,
  routingConfig: appRoutingConfig,
);

final appRoutingConfig = ValueNotifier<RoutingConfig>(
  RoutingConfig(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        redirect: (context, state) => AppRoutes.home.name,
      ),
      homeRouter,
      networkRouter,
    ],
  ),
);
