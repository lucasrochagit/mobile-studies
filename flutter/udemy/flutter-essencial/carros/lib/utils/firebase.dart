import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

FirebaseMessaging? fcm;

Future<void> initFcm() async {
  fcm ??= FirebaseMessaging.instance;

  fcm?.getToken().then((token) {
    print("\n******\nFirebase Token $token\n******\n");
  });

  fcm?.subscribeToTopic("all");

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
}
