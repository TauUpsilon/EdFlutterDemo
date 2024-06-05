import 'dart:async';

import 'package:eyr/app/app_locator.dart';
import 'package:eyr/app/app_util.dart';
import 'package:eyr/app/app_widget.dart';
import 'package:eyr/shared/services/logging_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  AppLocator.registerCommonServices();

  await runZonedGuarded(onStart, onError);
}

Future<void> onStart() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppUtil.initialise();

  runApp(App());
}

void onError(Object err, StackTrace stackTrace) {
  GetIt.I<LoggingService>().e('$err\n\n$stackTrace');
}
