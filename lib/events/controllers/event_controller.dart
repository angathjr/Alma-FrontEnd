import 'dart:developer';

import 'package:alma/core/api_provider_no_auth.dart';
import 'package:alma/events/models/event_model.dart';
import 'package:get/get.dart';

class EventsController extends GetxController {
  final ApiProviderNoAuth api = Get.find();
  var events = <EventModel>[].obs;

  void fetchEvents() async {
    final response = await api.getApi('/events/all');
    // log(response.statusCode.toString());
    // log(response.body);

    List<EventModel> parsed = eventModelFromJson(response.body);
    log("parses data${parsed[0].eventName}");
    log(parsed[0].skillsRequired![0].name.toString());
  }
}
