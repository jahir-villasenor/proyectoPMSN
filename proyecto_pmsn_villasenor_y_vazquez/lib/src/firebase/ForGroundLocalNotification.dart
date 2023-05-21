import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificacion {
  static final FlutterLocalNotificationsPlugin _notiPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'));
    _notiPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {
        print('onDidReceiveNotificationResponse Functiond');
        print(details.payload);
        print(details.payload != null);
      },
    );
  }

  static void showNotification(RemoteMessage message) {
    final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
            'com.example.proyecto_pmsn_villasenor_y_vazquez',
            'proyecto_pmsn_villasenor_y_vazquez',
            importance: Importance.max,
            priority: Priority.high));
    _notiPlugin.show(DateTime.now().microsecond, message.notification!.title,
        message.notification!.body, notificationDetails,
        payload: message.data.toString());
  }
}
