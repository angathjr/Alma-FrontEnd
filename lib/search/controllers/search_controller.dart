import 'dart:developer';
import 'package:alma/core/api_provider_no_auth.dart';
import 'package:alma/events/controllers/event_controller.dart';
import 'package:alma/events/models/event_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EventSearchController extends GetxController {
  final ApiProviderNoAuth api = Get.find();
  final EventsController eventsController = Get.find();

  TextEditingController searchTextController = TextEditingController();

  var events = <EventModel>[].obs;
  var isLoading = false.obs;
  var selectedIndex = 0.obs;

  void searchEvents() async {
    try {
      isLoading(true);
      final query = searchTextController.text.trim();
      if (query.isEmpty) {
        isLoading(false);
        return;
      }
      final response = await api.getApi('/events/search/$query');
      if (response.body != '[]') {
        final parsed = eventModelFromJson(response.body);
        events.value = parsed;
      } else {
        print("no events");
      }

      isLoading(false);
    } catch (error) {
      print("Error searching events: $error");
      isLoading(false);
    }
  }

  void textFieldOnChanged() {
    log(searchTextController.text);
    if (searchTextController.text.trim().isNotEmpty) searchEvents();
  }

  void clearSearchResults() {
    events.clear();
    searchTextController.clear();
  }

  void gotoEvent(EventModel eventdata) {
    eventsController.selectedEvent.value = eventdata;
    Get.toNamed('/feedDetails');
  }
}
