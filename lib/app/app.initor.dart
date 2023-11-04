part of 'app.widget.dart';

mixin AppInitor {
  static void initLocator() => GetIt.instance
    // Utils
    ..registerLazySingleton(Connectivity.new)

    // Services
    ..registerLazySingleton(LoggingService.new)
    ..registerLazySingleton(ApiService.new)
    ..registerLazySingleton(ApiModelService.new)
    ..registerLazySingleton(TodosApiService.new)

    // Stores
    ..registerLazySingleton(
      () => Store<GlobalState>(
        globalReducer,
        initialState: GlobalState.initialState(),
      ),
    )
    ..registerLazySingleton(
      () => AppRouter(
        navigatorKey: GlobalKey<NavigatorState>(),
      ),
    );

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
