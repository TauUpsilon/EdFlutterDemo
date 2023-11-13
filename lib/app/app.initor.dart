part of 'app.widget.dart';

mixin AppInitor {
  static void initLocator() => {
        GetIt.I
          // Router
          ..registerLazySingleton(
            () => AppRouter(
              navigatorKey: GlobalKey<NavigatorState>(),
            ),
          )

          // Utils
          ..registerLazySingleton(Connectivity.new)

          // Services
          ..registerLazySingleton(LoggingService.new)
          ..registerLazySingleton(ApiService.new)
          ..registerLazySingleton(TodosApiService.new)

          // Stores
          ..registerLazySingleton(
            () => Store<GlobalState>(
              globalReducer,
              initialState: GlobalState.initialState(),
            ),
          )

          // Global Cubits
          ..registerLazySingleton(MaskCubit.new)

          // Page Cubits
          ..registerLazySingleton(HomeCubit.new)
          ..registerLazySingleton(NetworkCubit.new),
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
