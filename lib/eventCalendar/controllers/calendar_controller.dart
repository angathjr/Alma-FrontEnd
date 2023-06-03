import 'dart:developer';
import 'package:alma/core/api_provider.dart';
import 'package:alma/events/models/event_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventCalendarController extends GetxController {
  final ApiProvider apiProvider = Get.find();

  var selectedDay = DateTime.now().obs;
  var events = <EventModel>[].obs;
  var isEventsFetched = false.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5), () {
      fetchEvents();
    });
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    selectedDay.value = day;
    fetchEvents();
  }

  void fetchEvents() async {
    isEventsFetched(false);
    String date = DateFormat('yyyy-MM-dd').format(selectedDay.value);
    final response = await apiProvider.getApi('/events/date=$date');
    log(" selected day events are ${response.body}");
    events.value = eventModelFromJson(response.body);
    isEventsFetched(true);
  }
}
