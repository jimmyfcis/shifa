import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
 class FirebaseNotification {
   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

   Future<void> setupFlutterNotifications() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // ID
      'High Importance Notifications', // Name
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    // Initialize flutter_local_notifications plugin
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Allow Firebase Messaging to show notifications when app is in foreground
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

   Future<void> showNotification(RemoteMessage message) async {
     final notification = message.notification;
     final android = message.notification?.android;

     if (notification != null && android != null) {
       await flutterLocalNotificationsPlugin.show(
         notification.hashCode,
         notification.title,
         notification.body,
         NotificationDetails(
           android: AndroidNotificationDetails(
             'high_importance_channel', // same as your channel id
             'High Importance Notifications',
             channelDescription: 'This channel is used for important notifications.',
             icon: '@mipmap/ic_launcher',
           ),
         ),
       );
     }
   }
}