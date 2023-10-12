part of 'app.widget.dart';

class AppLocator {
  static final getIt = GetIt.instance;

  static initLocator() {
    getIt
      // Utils
      ..registerLazySingleton(() => Connectivity())

      // Services
      ..registerLazySingleton(() => LoggingService())
      ..registerLazySingleton(() => ApiService())
      ..registerLazySingleton(() => ApiModelService())
      ..registerLazySingleton(() => TodosApiService())

      // Stores
      ..registerLazySingleton(() => Store<GlobalState>(globalReducer, initialState: GlobalState.initialState()))

      // Cubits
      ..registerLazySingleton(() => HomeCubit())
      ..registerLazySingleton(() => NetworkCubit());
  }
}
