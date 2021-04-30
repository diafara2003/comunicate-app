import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificacionProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  static Future<dynamic> onBackgroundMessage(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
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
    print('========= onLaunch ===========');
    print('message: $message');
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async {
    print('========= onResume ===========');
    print('message: $message');
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    print('========= onMessage ===========');
    print('message: $message');
  }
}
