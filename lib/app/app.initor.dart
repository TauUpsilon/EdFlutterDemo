import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eyr/api/api.service.dart';
import 'package:eyr/api/todos/todos.service.dart';
import 'package:eyr/app/app.router.dart';
import 'package:eyr/shares/services/logging.service.dart';
import 'package:eyr/shares/services/rsa.service.dart';
import 'package:eyr/states/cubit/mask/mask_cubit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

mixin AppInitor {
  static void initLocator() => {
        GetIt.I
          // Router
          ..registerLazySingleton(
            () => GoRouter.routingConfig(
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

  static Future<void> setEnvironment() async {
    const envStr = String.fromEnvironment('ENV');

    var envPath = 'environments/';

    switch (envStr) {
      case 'STAGE':
        envPath = '${envPath}stage.env';

      case 'PROD':
        envPath = '${envPath}prod.env';

      default:
        envPath = '${envPath}local.env';
        break;
    }

    await dotenv.load(
      fileName: envPath,
    );
  }
}
