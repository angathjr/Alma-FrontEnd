import 'dart:developer';
import 'dart:io';

import 'package:alma/core/api_provider_no_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController {
  final ApiProviderNoAuth api = Get.find();

  final TextEditingController companyName = TextEditingController();
  final TextEditingController role = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();

  var imageUrl = ''.obs;
  var isImageSelected = false.obs;
  var selectedEventType = "J".obs;

  Rx<File> selectedImage = Rx<File>(File(''));

  void pickImage() async {
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
      Get.snackbar("Failed", "failed to pick image $e");
    }
  }

  void removeSelectedImage() {
    selectedImage.value = File('');
    isImageSelected(false);
  }

  void goToEventDetailCompletion() {
    switch (selectedEventType.value) {
      case 'J':
        Get.toNamed('/jobDetailCompletion');
        break;
      case 'I':
        Get.toNamed('/internshipDetailCompletion');
        break;
      case 'O':
        Get.toNamed('/otherDetailCompletion');
        break;
      case 'C':
        Get.toNamed('/collageEventsDesc');
        break;
    }
  }
}
