import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eyr/api/api_service.dart';
import 'package:eyr/api/json_place_holder/todos/todos_service.dart';
import 'package:eyr/app/app_router.dart';
import 'package:eyr/shared/services/logging_service.dart';
import 'package:eyr/shared/services/rsa_service.dart';
import 'package:eyr/shared/widgets/app_alert/app_alert_view.dart';
import 'package:eyr/shared/widgets/app_mask/app_mask_view.dart';
import 'package:eyr/states/env/env_cubit.dart';
import 'package:eyr/states/init/init_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();
mixin AppLocator {
  static void registerCommonServices() => {
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

          // Api Services
          ..registerLazySingleton(TodosService.new)

          // Global Cubits
          ..registerLazySingleton(InitCubit.new)
          ..registerLazySingleton(EnvCubit.new)
          ..registerLazySingleton(AppMaskCubit.new)
          ..registerLazySingleton(AppAlertCubit.new),
      };
}
