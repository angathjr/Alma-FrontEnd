import 'dart:developer';

import 'package:alma/core/api_provider.dart';
import 'package:alma/events/models/event_model.dart';
import 'package:alma/profile/controllers/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/constants.dart';

class EventEditController extends GetxController {
  final ApiProvider api = Get.find();
  final ProfileController profileController = Get.find();

  //text editing controllers
  TextEditingController companyName = TextEditingController();
  TextEditingController eventName = TextEditingController();
  TextEditingController role = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController skillsRequired = TextEditingController();
  TextEditingController venue = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController eventLink = TextEditingController();

  var dropDownContents = ["Edit", "Delete"].obs;

  var selectedOption = "Edit".obs;
  var selectedEvent = EventModel().obs;
  var selectedEventType = "J".obs;

  var eventDate = ''.obs;
  var chosenDate = DateTime.now().obs;
  var lastDayToApply = ''.obs;
  var isPosting = false.obs;
  var selectedDate = ''.obs;
  var postingText = 'Post'.obs;

  @override
  void onInit() {
    print("init");
    eventName = TextEditingController(text: selectedEvent.value.eventName);
    companyName = TextEditingController(text: selectedEvent.value.companyName);
    role = TextEditingController(text: selectedEvent.value.role);
    description =
        TextEditingController(text: selectedEvent.value.eventDescription);
    skillsRequired = TextEditingController(
        text: selectedEvent.value.skillsRequired?.join(", "));
    venue = TextEditingController(text: selectedEvent.value.venue);
    duration = TextEditingController(text: selectedEvent.value.duration);
    eventLink = TextEditingController(text: selectedEvent.value.eventLink);

    eventDate.value = DateFormat("yyyy-MM-dd")
        .format(selectedEvent.value.eventDate ?? DateTime.now());
    lastDayToApply.value = DateFormat("yyyy-MM-dd")
        .format(selectedEvent.value.lastDateToApply ?? DateTime.now());

    super.onInit();
  }

  void goToEventDetailCompletion(String value) {
    selectedEventType.value = value;
    switch (value) {
      case 'J':
        Get.toNamed('/jobEdit-description');
        break;
      case 'I':
        Get.toNamed('/internshipEdit-description');
        break;
      case 'O':
        Get.toNamed('/otherEventEdit-description');
        break;
      case 'C':
        Get.toNamed('/collageEventsEdit-description');
        break;
    }
  }

  void deleteEvent(int id) async {
    try {
      final response = await api.deleteApi("/events/delete/$id");
      if (response.statusCode == 201) {
        Get.snackbar("Delete", "Post Removed Successfully");
        profileController.fetchMyEvents();
      }
      log("${response.body} ");
    } catch (e) {
      log(e.toString());
    }
  }

  // api calls updating the event

  void updateJobAndInternship() async {
    if (lastDayToApply.value == '' || eventName.text.isEmpty) {
      Get.snackbar("Failed", "Please fill the dates and name");
      return;
    }
    List<String> skills = skillsRequired.text.split(',');
    isPosting(true);
    postingText("Posting...");

    // if (isImageSelected.value) {
    //   await uploadImage();
    // }
    Map jobdata = {
      "event_name": eventName.text,
      "company_name": companyName.text,
      "role": role.text,
      "event_description": description.text,
      "skills_required": skills,
      // "img_url": imageUrl.value,
      "event_type": selectedEventType.value,
      "last_date_to_apply": lastDayToApply.value,
    };
    log("job data is $jobdata");

    try {
      final response =
          await api.putApi('/events/update/${selectedEvent.value.id}', jobdata);
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

  void updateCollegeAndOtherEvent() async {
    if (eventDate.value == '' ||
        lastDayToApply.value == '' ||
        eventName.text.isEmpty) {
      Get.snackbar("Failed", "Please fill event date and name");
      return;
    }
    isPosting(true);
    postingText("Posting...");
    // if (isImageSelected.value) {
    //   await uploadImage();
    // }
    Map data = {
      "event_name": eventName.text,
      "event_description": description.text,
      "venue": venue.text,
      "event_date": eventDate.value,
      // "img_url": imageUrl.value,
      "event_type": selectedEventType.value,
      "last_date_to_apply": lastDayToApply.value,
      "duration": duration.text,
    };

    log("college or other  data is $data");

    try {
      final response =
          await api.putApi('/events/update/${selectedEvent.value.id}', data);
      log("status code is ${response.statusCode}");
      log("response is ${response.body}");
      if (response.statusCode == 201) {
        Get.snackbar(
          "Success",
          "Post Updated successfully",
        );
        clearAll();
        isPosting(false);
        postingText("Done");
        await Future.delayed(const Duration(milliseconds: 1000));
        Get.back();
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

  void clearAll() {
    clearControllers();
    // removeSelectedImage();
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

  //function to pick date
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
}
