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

    String nome = message.data['nome'];
    print("onMessage: $nome");

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Got a message whilst in the background!');
  print('Message data: ${message.data}');

  String nome = message.data['nome'];
  print("onMessage: $nome");

  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
}