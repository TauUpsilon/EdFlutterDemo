import 'dart:developer';

import 'package:eyr/app/app_locator.dart';
import 'package:eyr/app/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppConfig.loadEnv();

  AppInitor.initLocator();

  await Firebase.initializeApp();

  // You may set the permission requests to "provisional" which allows the user to choose what type
  // of notifications they would like to receive once the user receives a notification.
  await FirebaseMessaging.instance.requestPermission(
    provisional: true,
    criticalAlert: true,
  );

  // For apple platforms, ensure the APNS token is available before making any FCM plugin API calls
  final token = await FirebaseMessaging.instance.getToken();
  if (token != null) {
    // APNS token is available, make FCM plugin API requests...
    log(token);
  }

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await FlutterNotificationChannel.registerNotificationChannel(
    id: 'com.example.flutter_proj',
    name: 'com.example.flutter_proj',
    description: 'Your channel description',
    importance: NotificationImportance.IMPORTANCE_HIGH,
  );

  runApp(
    App(
      key: UniqueKey(),
    ),
  );
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(message.notification?.android?.channelId);
}
