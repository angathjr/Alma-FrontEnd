import 'dart:developer';
import 'package:alma/core/api_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;

class FCMController extends GetxController {
  final ApiProvider api = Get.find();

  late FirebaseMessaging messaging;
  late NotificationSettings settings;

  @override
  void onInit() {
    super.onInit();
    messaging = FirebaseMessaging.instance;
    handleRequest();
    fetchToken();
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
    String? token = await messaging.getToken();
    String? platform;
    log("FirebaseMessaging token: $token");
    if(Platform.isAndroid){
      platform="android";
    }else {
      platform="ios";
    }
    Map<String,dynamic> data = {'token': token,"device_type":platform};
    // final response=await api.postApi('/fcm/device', data);
    // log(response.body);
  }
}
