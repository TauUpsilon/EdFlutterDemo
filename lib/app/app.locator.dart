part of 'app.widget.dart';

mixin AppLocator {
  static final getIt = GetIt.instance;

  static void initLocator() {
    getIt
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
      );
  }
}
