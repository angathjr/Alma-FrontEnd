import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FCMController extends GetxController {
  late FirebaseMessaging messaging;
  late NotificationSettings settings;

  @override
  void onInit() {
    super.onInit();
    messaging = FirebaseMessaging.instance;
  }
}
