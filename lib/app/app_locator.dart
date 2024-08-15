import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eyr/api/api_service.dart';
import 'package:eyr/api/eyr_spring_boot/api000/api000_service.dart';
import 'package:eyr/api/eyr_spring_boot/api001/api001_service.dart';
import 'package:eyr/apn/app_router.dart';
import 'package:eyr/app/app_navigator.dart';
import 'package:eyr/shared/services/crypto_service.dart';
import 'package:eyr/shared/services/logging_service.dart';
import 'package:eyr/shared/widgets/app_alert/app_alert_view.dart';
import 'package:eyr/states/auth/auth_cubit.dart';
import 'package:eyr/states/env/env_cubit.dart';
import 'package:eyr/states/init/init_cubit.dart';
import 'package:eyr/states/locale/locale_cubit.dart';
import 'package:eyr/states/mask/mask_cubit.dart';
import 'package:get_it/get_it.dart';

mixin AppLocator {
  static void registerCommonServices() => {
        GetIt.I
          // Router
          ..registerLazySingleton(() => router)

          // Utils
          ..registerLazySingleton(Connectivity.new)

          // Services
          ..registerLazySingleton(LoggingService.new)
          ..registerLazySingleton(ApiService.new)
          ..registerLazySingleton(CryptoService.new)

          // Api Services
          ..registerLazySingleton(Api000Service.new)
          ..registerLazySingleton(Api001Service.new)

          // Global Cubits
          ..registerLazySingleton(AuthCubit.new)
          ..registerLazySingleton(InitCubit.new)
          ..registerLazySingleton(EnvCubit.new)
          ..registerLazySingleton(LocaleCubit.new)
          ..registerLazySingleton(
            () => MaskCubit(getContext: () => AppNavigator.context),
          )
          ..registerLazySingleton(AppAlertCubit.new),
      };
}
