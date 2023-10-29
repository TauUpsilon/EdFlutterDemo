import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_proj/app/app.widget.dart';

void main() async {
  await setEnvironment();

  AppLocator.initLocator();

  runApp(
    App(
      key: UniqueKey(),
    ),
  );
}

Future<void> setEnvironment() async {
  const envStr = String.fromEnvironment('ENV');

  var envPath = 'environments/';

  switch (envStr) {
    case 'STAGE':
      envPath = '${envPath}stage.env';

    case 'PROD':
      envPath = '${envPath}prod.env';

    default:
      envPath = '${envPath}local.env';
      break;
  }

  await dotenv.load(
    fileName: envPath,
  );
}
