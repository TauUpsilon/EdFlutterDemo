part of 'app.widget.dart';

class AppLocator {
  static final locator = GetIt.instance;

  static initLocator() {
    // Utils
    locator.registerLazySingleton(() => Connectivity());

    // Services
    locator.registerLazySingleton(() => LoggingService());
    locator.registerLazySingleton(() => ApiService());
    locator.registerLazySingleton(() => ApiModelService());
    locator.registerLazySingleton(() => TodosApiService());

    // Stores
    locator.registerLazySingleton(() => Store<GlobalState>(globalReducer, initialState: GlobalState.initialState()));
  }
}
