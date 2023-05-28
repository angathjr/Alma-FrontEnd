import 'dart:developer';

import 'package:alma/auth/controllers/auth_controller.dart';
import 'package:alma/core/api_provider.dart';
import 'package:alma/core/api_provider_no_auth.dart';
import 'package:alma/events/models/event_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EventSearchController extends GetxController {
  final ApiProviderNoAuth api = Get.find();

  TextEditingController searchTextController = TextEditingController();

  var events = <EventModel>[].obs;
  var isLoading = false.obs;

  Future<void> searchEvents() async {
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
  }

  void textFieldOnChanged() {
    log(searchTextController.text);
    if (searchTextController.text.trim().isNotEmpty) searchEvents();
  }
}
