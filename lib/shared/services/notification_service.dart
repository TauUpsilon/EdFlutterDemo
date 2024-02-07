// import 'dart:io';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_notification_channel/flutter_notification_channel.dart';
// import 'package:flutter_notification_channel/notification_importance.dart';

// class NotificationService {
//   // This ID has to be the same one as in android strings.xml
//   static final androidChannelID = 'cc.worldline.mbkfe.hsbc_mobile_frontend';
//   static final androidChannelName = 'HSBC Channel';
//   static final _notificationService = NotificationService._internal();

//   factory NotificationService() => _notificationService;

//   NotificationService._internal();

//   final localNotifier = FlutterLocalNotificationsPlugin();

//   Future<void> init() async {
//     //Initialization Settings for Android
//     const initSettingsAndroid = AndroidInitializationSettings('ic_launcher');

//     //Initialization Settings for iOS
//     const initSettingsIOS = DarwinInitializationSettings(
//       requestSoundPermission: false,
//       requestBadgePermission: false,
//       requestAlertPermission: false,
//     );

//     const initSettings = InitializationSettings(
//       android: initSettingsAndroid,
//       iOS: initSettingsIOS,
//     );

//     await localNotifier.initialize(initSettings);

//     if (!Platform.isAndroid) return;

//     FlutterNotificationChannel.registerNotificationChannel(
//       id: NotificationService.androidChannelID,
//       name: NotificationService.androidChannelName,
//       description: 'HSBC notification channel',
//       importance: NotificationImportance.IMPORTANCE_HIGH,
//     );
//   }

//   static final _androidNotificationDetails = AndroidNotificationDetails(
//     NotificationService.androidChannelID,
//     NotificationService.androidChannelName,
//     playSound: true,
//     priority: Priority.high,
//     importance: Importance.high,
//   );

//   static const _iosNotificationDetails = DarwinNotificationDetails(
//     presentAlert: true,
//     presentBadge: true,
//     presentSound: true,
//     badgeNumber: 0,
//   );

//   static final platformChannelSpecifics = NotificationDetails(
//     android: _androidNotificationDetails,
//     iOS: _iosNotificationDetails,
//   );

//   Future<void> showNotifications(String? title, String? body) async {
//     await localNotifier.show(
//       0,
//       title,
//       body,
//       platformChannelSpecifics,
//       payload: 'Notification Payload',
//     );
//   }
// }
