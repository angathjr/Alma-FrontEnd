import 'dart:developer';
import 'package:alma/core/api_provider_no_auth.dart';
import 'package:alma/events/models/event_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventCalendarController extends GetxController {
  final ApiProviderNoAuth apiProvider = Get.find();

  var selectedDay = DateTime.now().obs;
  var events = <EventModel>[].obs;
  var isEventsFetched = false.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    fetchEvents();
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    selectedDay.value = day;
    fetchEvents();
  }

  void fetchEvents() async {
    isEventsFetched(false);
    String date = DateFormat('yyyy-MM-dd').format(selectedDay.value);
    final response = await apiProvider.getApi('/events/date=$date');
    events.value = eventModelFromJson(response.body);
    isEventsFetched(true);
  }
}
