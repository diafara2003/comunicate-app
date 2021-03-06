import 'dart:async';

import 'package:comunicate_colegios_app/services/Auth/login_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

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
    FlutterAppBadger.updateBadgeCount(1);

    // Or do other work.
  }

  initNotificacions() async {
    await _firebaseMessaging.requestNotificationPermissions();
    final token = await _firebaseMessaging.getToken();

    print('========= token ===========');
    print('token $token');

    await new LoginProvider().registarToken(token);

    _firebaseMessaging.configure(
        onMessage: onMessage,
        onBackgroundMessage: onBackgroundMessage,
        onLaunch: onLaunch,
        onResume: onResume);
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    FlutterAppBadger.removeBadge();
    messageStringController.add('notificacion');
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async {
    messageStringController.add('notificacion');
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    FlutterAppBadger.updateBadgeCount(1);
    messageStringController.add('notificacion');
  }

  static closeMessage() {
    messageStringController.close();
  }
}
