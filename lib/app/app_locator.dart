import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eyr/api/api.service.dart';
import 'package:eyr/api/todos/todos.service.dart';
import 'package:eyr/app/app_router.dart';
import 'package:eyr/shares/services/logging_service.dart';
import 'package:eyr/shares/services/rsa.service.dart';
import 'package:eyr/states/cubit/mask/mask_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();
mixin AppInitor {
  static void initLocator() => {
        GetIt.I
          // Router
          ..registerLazySingleton(
            () => GoRouter.routingConfig(
              navigatorKey: navigatorKey,
              initialLocation: '/home',
              debugLogDiagnostics: true,
              routingConfig: appRoutingConfig,
            ),
          )

          // Utils
          ..registerLazySingleton(Connectivity.new)

          // Services
          ..registerLazySingleton(LoggingService.new)
          ..registerLazySingleton(ApiService.new)
          ..registerLazySingleton(RsaService.new)
          ..registerLazySingleton(TodosApiService.new)

          // Global Cubits
          ..registerLazySingleton(MaskCubit.new),
      };
}
