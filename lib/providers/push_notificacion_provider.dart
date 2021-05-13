import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificacionProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  static StreamController<String> messageStringController =
      new StreamController.broadcast();

  static Stream<String> get messageString => messageStringController.stream;

  static Future<dynamic> onBackgroundMessage(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      messageStringController.add('notificacion');
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      messageStringController.add('notificacion');
    }

    // Or do other work.
  }

  initNotificacions() async {
    await _firebaseMessaging.requestNotificationPermissions();
    final token = await _firebaseMessaging.getToken();

    print('========= token ===========');
    print('token $token');

    _firebaseMessaging.configure(
        onMessage: onMessage,
        onBackgroundMessage: onBackgroundMessage,
        onLaunch: onLaunch,
        onResume: onResume);
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    messageStringController.add('notificacion');
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async {
    messageStringController.add('notificacion');
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    messageStringController.add('notificacion');
  }

  static closeMessage() {
    messageStringController.close();
  }
}
