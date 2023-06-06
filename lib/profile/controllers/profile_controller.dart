import 'dart:developer';
import 'dart:io';
import 'package:alma/core/api_provider.dart';
import 'package:alma/events/models/event_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../auth/models/user.dart';

class ProfileController extends GetxController {
 

  final _storage = GetStorage();
  final ApiProvider api = Get.find();

  var user = (UserModel()).obs;
  var events = <EventModel>[].obs;

  var isEventsloading = false.obs;

  //pick image
  Rx<File> selectedImage = Rx<File>(File(''));
  var imageUrl = ''.obs;
  var isImageSelected = false.obs;
  var isUpdated = false.obs;

  @override
  void onInit() {
    _storage.listenKey('user', (value) {
      user.value = UserModel.fromJson(_storage.read('user'));
    });
    user.value = UserModel.fromJson(_storage.read('user'));
    super.onInit();
  }

  void selectImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image =
          await picker.pickImage(source: ImageSource.gallery, imageQuality: 60);
      if (image == null) return;
      selectedImage.value = File(image.path);
      isImageSelected(true);
      if (kDebugMode) {
        log("image location is ${selectedImage.value}");
      }
    } on PlatformException catch (e) {
      print("failed to pick image $e");
    }
  }

  void fetchMyEvents() async {
    try {
      isEventsloading(true);
      Get.toNamed('/myEvents');
      final response = await api.getApi('/events/my-events/');
      final parsed = eventModelFromJson(response.body);
      events.value = parsed;
      log("${response.body}");
      isEventsloading(false);
    } catch (e) {
      log(e.toString());
    } finally {
      isEventsloading(false);
    }
  }
}
