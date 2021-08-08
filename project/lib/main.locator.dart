import 'package:get_it/get_it.dart';
import 'package:project/pages/user/user.service.dart';
import 'package:project/shared/services/api.service.dart';
import 'package:project/shared/services/store.service.dart';

final locator = GetIt.instance;

void initializeLocator() {
  locator.registerLazySingleton<ApiService>(() => ApiService());
  locator.registerLazySingleton<StoreService>(() => StoreService());
  locator.registerLazySingleton<UserService>(() => UserService());
}
