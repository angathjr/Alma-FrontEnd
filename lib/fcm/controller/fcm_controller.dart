import 'dart:developer';
import 'package:alma/core/api_provider.dart';
import 'package:alma/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;
import 'package:get_storage/get_storage.dart';

class FcmController extends GetxController {
  final ApiProvider api = Get.find();
  late FirebaseMessaging messaging;
  late NotificationSettings settings;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    messaging = FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    handleRequest();
    handleForegroundNotifications();
    // fetchToken();
  }

  void handleForegroundNotifications() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                notificationChannel.id,
                notificationChannel.name,
                channelDescription: notificationChannel.description,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }

      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');

      if (message.notification != null) {
        log('Message also contained a notification: ${message.notification}');
      }
    });
  }

  void handleRequest() async {
    settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  void fetchToken() async {
    try {
      String? token = await messaging.getToken();
      String? platform;
      log("FirebaseMessaging token: $token");
      if (Platform.isAndroid) {
        platform = "android";
      } else {
        platform = "ios";
      }
      Map<String, dynamic> data = {'token': token, "device_type": platform};

      var isDeviceAdded = storage.read('isDeviceAdded');

      if (isDeviceAdded == false) {
        final response = await api.postApi('/fcm/device', data);
        await storage.write('isDeviceAdded', true);
        log(response.body);
      }
    } catch (error) {
      log("Error fetching token: $error");
    }
  }
}
