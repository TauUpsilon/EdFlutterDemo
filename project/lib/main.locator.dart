import 'package:get_it/get_it.dart';
import 'package:project/featured/demo/pages/clone/list_items/ubike/ubike.service.dart';
import 'package:project/shared/services/api.service.dart';
import 'package:project/shared/services/store.service.dart';

final locator = GetIt.instance;

void initializeLocator() {
  locator.registerLazySingleton<ApiService>(() => ApiService());
  locator.registerLazySingleton<StoreService>(() => StoreService());
  locator.registerLazySingleton<UBikeService>(() => UBikeService());
}
