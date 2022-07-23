import 'package:flutter/material.dart';

import 'package:flutter_proj/app/app.locator.dart';
import 'package:flutter_proj/app/app.page.dart';
import 'package:flutter_proj/app/app.settings.dart';

void main() async {
  await AppSettings.setEnvironment();

  AppLocator.initLocator();

  runApp(
    MyApp(
      key: UniqueKey(),
    ),
  );
}
