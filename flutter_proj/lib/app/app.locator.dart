import 'package:get_it/get_it.dart';
import 'package:flutter_proj/api/services/mbm081018.service.dart';

class AppLocator {
  static final locator = GetIt.instance;

  static initLocator() {
    GetIt getIt = locator;

    getIt.registerSingleton<MBM081018Service>(
      MBM081018Service(),
      signalsReady: true,
    );
  }
}
