import 'dart:async';

import 'package:eyr/api/api_service.dart';
import 'package:eyr/app/app_locator.dart';
import 'package:eyr/app/app_util.dart';
import 'package:eyr/app/app_widget.dart';
import 'package:eyr/shared/services/logging_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  await runZonedGuarded(onStart, onError);
}

Future<void> onStart() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppLocator.registerCommonServices();

  await AppUtil.initialise();

  await Firebase.initializeApp();

  FirebaseCrashlytics.instance.setUserIdentifier('12345');

  runApp(App());
}

void onError(Object exception, StackTrace stacktrace) {
  final StackTrace stack;
  final String log;

  if (exception is ApiException) {
    log = exception.toLog();
    stack = exception.toCrashlytics();
  } else {
    log = '$exception\nStackTrace:\n$stacktrace';
    stack = stacktrace;
  }

  GetIt.I<LoggingService>().e(log);

  FirebaseCrashlytics.instance.recordError(
    exception,
    stack,
    fatal: true,
    printDetails: true,
  );
}
