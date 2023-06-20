import 'dart:developer';

import 'package:alma/core/api_provider.dart';
import 'package:alma/events/models/event_model.dart';
import 'package:get/get.dart';

class EventEditController extends GetxController {
  final ApiProvider api = Get.find();

  var dropDownContents = ["Edit", "Delete"].obs;

  var selectedOption = "Edit".obs;
  var selectedEvent = EventModel().obs;

  void editEvent() async {}

  void deleteEvent(int id) async {
    try {
      print(id);
      final response = await api.deleteApi("/events/delete/$id");

      log("${response.body} ");
    } catch (e) {
      log(e.toString());
    }
  }
}
