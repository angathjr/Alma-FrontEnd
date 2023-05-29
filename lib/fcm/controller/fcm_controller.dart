import 'dart:developer';
import 'package:alma/core/api_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;

import 'package:get_storage/get_storage.dart';

class FCMController extends GetxController {
  final ApiProvider api = Get.find();

  late FirebaseMessaging messaging;
  late NotificationSettings settings;
  final storage=GetStorage();

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
    var isDeviceAdded =storage.read('isDeviceAdded');


    // if(isDeviceAdded==false){
    //   final response=await api.postApi('/fcm/device', data);
    //   await storage.write('isDeviceAdded', true);
    //   log(response.body);
    // }
   
  }
}
