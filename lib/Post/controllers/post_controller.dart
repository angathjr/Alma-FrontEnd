import 'dart:developer';
import 'dart:io';
import 'package:alma/core/api_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController {
  final ApiProvider api = Get.find();

  final TextEditingController companyName = TextEditingController();
  final TextEditingController eventName = TextEditingController();
  final TextEditingController role = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final TextEditingController skillsRequired = TextEditingController();
  final TextEditingController venue = TextEditingController();

  var imageUrl = ''.obs;
  var isImageSelected = false.obs;
  var selectedEventType = "J".obs;
  var isImageUploaded = false.obs;

  Rx<File> selectedImage = Rx<File>(File(''));

  void addCollegeAndOtherEvent() async {

    if (isImageSelected.value) {
      await uploadImage();
    }
    Map jobdata = {
      "event_name": eventName.text,
      "event_description": description.text,
      "venue": venue.text,
      "event_date": startDate.text,
      "img_url": imageUrl.value,
      "event_type": selectedEventType.value
    };
    log("college or other  data is $jobdata");

    final response = await api.postApi('/events/add', jobdata);
    log("status code is ${response.statusCode}");
    log("response is ${response.body}");
    if (response.statusCode == 201) {
      Get.snackbar(
        "Success",
        "Event added successfully",
      );
      clearAll();
      await Future.delayed(const Duration(milliseconds: 1400));
      Get.offAllNamed('/');
    } else {
      Get.snackbar("Failed", "Failed to add  event ");
    }
  }

  void addInternshipEvent() async {
    List<String> skills = skillsRequired.text.split(',');

    if (isImageSelected.value) {
      await uploadImage();
    }
    Map jobdata = {
      "event_name": "custom event for Internship testing ",
      "company_name": companyName.text,
      "event_description": description.text,
      "skills_required": skills,
      "event_date": startDate.text,
      "img_url": imageUrl.value,
      "event_type": selectedEventType.value
    };
    log("internship  data is $jobdata");

    final response = await api.postApi('/events/add', jobdata);
    log("status code is ${response.statusCode}");
    log("response is ${response.body}");
    if (response.statusCode == 201) {
      Get.snackbar(
        "Success",
        "Internship added successfully",
      );
      clearAll();
      await Future.delayed(const Duration(milliseconds: 1400));
      Get.offAllNamed('/');
    } else {
      Get.snackbar("Failed", "Failed to add internship");
    }
  }

  void addJobEvent() async {
    List<String> skills = skillsRequired.text.split(',');

    if (isImageSelected.value) {
      await uploadImage();
    }
    Map jobdata = {
      "event_name": "custom event for job test",
      "company_name": companyName.text,
      "role": role.text,
      "event_description": description.text,
      "skills_required": skills,
      "img_url": imageUrl.value,
      "event_type": selectedEventType.value
    };
    log("job data is $jobdata");

    final response = await api.postApi('/events/add', jobdata);
    log("status code is ${response.statusCode}");
    log("response is ${response.body}");
    if (response.statusCode == 201) {
      Get.snackbar(
        "Success",
        "Job added successfully",
        snackPosition: SnackPosition.TOP,
      );
      clearAll();
      await Future.delayed(const Duration(milliseconds: 1400));
      Get.offAllNamed('/');
    } else {
      Get.snackbar("Failed", "Failed to add Job");
    }
  }

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
        Get.toNamed('/job-description');
        break;
      case 'I':
        Get.toNamed('/internship-description');
        break;
      case 'O':
        Get.toNamed('/otherEventdes-description');
        break;
      case 'C':
        Get.toNamed('/collageEventsDesc');
        break;
    }
  }

  Future<void> uploadImage() async {
    try {
      final storageRef = FirebaseStorage.instance.ref();

      final profileRef = storageRef.child('jobs/${companyName.text}');
      await profileRef.putFile(
        selectedImage.value,
      );
      imageUrl.value = await profileRef.getDownloadURL();
      log(imageUrl.value);
    } catch (e) {
      log("error in uploading img ${e}");
    }
  }

  void clearAll() {
    companyName.clear();
    eventName.clear();
    role.clear();
    description.clear();
    startDate.clear();
    endDate.clear();
    skillsRequired.clear();
    venue.clear();
    removeSelectedImage();
  }

  void clearControllers() {
    companyName.clear();
    eventName.clear();
    role.clear();
    description.clear();
    startDate.clear();
    endDate.clear();
    skillsRequired.clear();
    venue.clear();
  }
}
