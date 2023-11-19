import 'package:eyr/app/app.widget.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppInitor.setEnvironment();

  AppInitor.initLocator();

  runApp(
    App(
      key: UniqueKey(),
    ),
  );
}
