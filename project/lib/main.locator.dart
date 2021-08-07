import 'package:get_it/get_it.dart';
import 'package:project/main.service.dart';

final locator = GetIt.instance;

void initLocator() {
  locator.registerLazySingleton<ApiService>(() => ApiService());
  locator.registerLazySingleton<StoreService>(() => StoreService());
  locator.registerLazySingleton<MainService>(() => MainService());
}
