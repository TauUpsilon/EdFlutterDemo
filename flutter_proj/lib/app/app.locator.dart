import 'package:flutter_proj/shared/services/app_logger.service.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_proj/api/services/mbm081018.service.dart';

class AppLocator {
  static final locator = GetIt.instance;

  static initLocator() {
    GetIt getIt = locator;

    getIt.registerLazySingleton<AppLogService>(() => AppLogService());
    getIt.registerLazySingleton<MBM081018Service>(() => MBM081018Service());
  }
}
