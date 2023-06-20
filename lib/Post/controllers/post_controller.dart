import 'dart:developer';
import 'dart:io';

import 'package:alma/core/api_provider.dart';
import 'package:alma/core/constants.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PostController extends GetxController {
  final ApiProvider api = Get.find();

  final TextEditingController companyName = TextEditingController();
  final TextEditingController eventName = TextEditingController();
  final TextEditingController role = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final TextEditingController skillsRequired = TextEditingController();
  final TextEditingController venue = TextEditingController();
  final TextEditingController duration = TextEditingController();
  final TextEditingController eventLink = TextEditingController();

  var imageUrl = ''.obs;
  var isImageSelected = false.obs;
  var selectedEventType = "J".obs;
  var isImageUploaded = false.obs;

  var eventDate = ''.obs;
  var chosenDate = DateTime.now().obs;
  var lastDayToApply = ''.obs;
  var isPosting = false.obs;
  var selectedDate = ''.obs;
  var postingText = 'Post'.obs;

  Rx<File> selectedImage = Rx<File>(File(''));

  //functions to perform each tasks

  void addCollegeAndOtherEvent() async {
    if (eventDate.value == '' ||
        lastDayToApply.value == '' ||
        eventName.text.isEmpty) {
      Get.snackbar("Failed", "Please fill event date and name");
      return;
    }
    isPosting(true);
    postingText("Posting...");
    if (isImageSelected.value) {
      await uploadImage();
    }
    Map data = {
      "event_name": eventName.text,
      "event_description": description.text,
      "venue": venue.text,
      "event_date": eventDate.value,
      "img_url": imageUrl.value,
      "event_type": selectedEventType.value,
      "last_date_to_apply": lastDayToApply.value,
      "duration": duration.text,
      "event_link": eventLink.text
    };

   
    log("college or other  data is $data");

    try {
      final response = await api.postApi('/events/add', data);
      log("status code is ${response.statusCode}");
      log("response is ${response.body}");
      if (response.statusCode == 201) {
        Get.snackbar(
          "Success",
          "Event added successfully",
        );
        clearAll();
        isPosting(false);
        postingText("Done");
        await Future.delayed(const Duration(milliseconds: 1000));
        Get.until((route) => Get.currentRoute == '/');
      } else {
        Get.snackbar("Failed", "Failed to add  event ");
      }
    } catch (e) {
      postingText("Try Again");
      log("error is $e");
    } finally {
      isPosting(false);
      postingText("Post");
    }
  }

  void addInternshipEvent() async {
    if (eventDate.value == '' ||
        lastDayToApply.value == '' ||
        eventName.text.isEmpty) {
      Get.snackbar("Failed", "Please fill event date and name");
      return;
    } else {
      List<String> skills = skillsRequired.text.split(',');
      isPosting(true);
      postingText("Posting...");

      if (isImageSelected.value) {
        await uploadImage();
      }
      Map jobdata = {
        "event_name": eventName.text,
        "company_name": companyName.text,
        "event_description": description.text,
        "skills_required": skills,
        "event_date": eventDate.value,
        "img_url": imageUrl.value,
        "event_type": selectedEventType.value,
        "last_date_to_apply": lastDayToApply.value,
        "duration": duration.text,
        "event_link": eventLink.text
      };
      log("internship  data is $jobdata");

      try {
        final response = await api.postApi('/events/add', jobdata);
        log("status code is ${response.statusCode}");
        log("response is ${response.body}");
        if (response.statusCode == 201) {
          Get.snackbar(
            "Success",
            "Internship added successfully",
          );
          clearAll();
          isPosting(false);
          postingText("Done");
          await Future.delayed(const Duration(milliseconds: 1000));
          Get.until((route) => Get.currentRoute == '/');
        } else {
          Get.snackbar("Failed", "Failed to add internship");
        }
      } catch (e) {
        log("error is $e");
      } finally {
        isPosting(false);
        postingText("Post");
      }
    }
  }

  void addJobEvent() async {
    if (lastDayToApply.value == '' || eventName.text.isEmpty) {
      Get.snackbar("Failed", "Please fill the dates and name");
      return;
    }
    List<String> skills = skillsRequired.text.split(',');
    isPosting(true);
    postingText("Posting...");

    if (isImageSelected.value) {
      await uploadImage();
    }
    Map jobdata = {
      "event_name": eventName.text,
      "company_name": companyName.text,
      "role": role.text,
      "event_description": description.text,
      "skills_required": skills,
      "img_url": imageUrl.value,
      "event_type": selectedEventType.value,
      "duration":duration.text,
      "last_date_to_apply": lastDayToApply.value,
      "event_link": eventLink.text
    };
    log("job data is $jobdata");

    try {
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
        isPosting(false);
        postingText("Done");
        await Future.delayed(const Duration(milliseconds: 1000));
        Get.until((route) => Get.currentRoute == '/');
      } else {
        Get.snackbar("Failed", "Failed to add Job");
      }
    } catch (e) {
      log("error is $e");
    } finally {
      isPosting(false);
      postingText("Post");
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

      final profileRef = storageRef
          .child('events/${eventName.text + DateTime.now().toString()}');
      await profileRef.putFile(
        selectedImage.value,
      );
      imageUrl.value = await profileRef.getDownloadURL();
      log(imageUrl.value);
    } catch (e) {
      log("error in uploading img ${e}");
    }
  }

  Future<void> pickDate(ctx, h) async {
    await showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              decoration: BoxDecoration(
                  color: Constants.cardColor(),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: h * 0.5,
              child: SizedBox(
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  maximumYear: 2055,
                  minimumYear: 2021,
                  dateOrder: DatePickerDateOrder.ymd,
                  onDateTimeChanged: (val) {
                    print(val);
                    selectedDate.value = DateFormat('yyyy-MM-dd').format(val);
                  },
                ),
              ),
            ));
  }

  void clearAll() {
    clearControllers();
    removeSelectedImage();
  }

  void clearControllers() {
    companyName.clear();
    eventName.clear();
    role.clear();
    description.clear();
    endDate.clear();
    skillsRequired.clear();
    venue.clear();
    duration.clear();
    eventLink.clear();
    lastDayToApply.value = '';
    selectedDate.value = '';
    eventDate.value = '';
  }
}
