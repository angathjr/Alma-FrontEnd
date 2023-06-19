import 'dart:developer';
import 'package:alma/core/api_provider.dart';
import 'package:alma/events/models/event_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class EventsController extends GetxController {
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventTypeController = TextEditingController();
  final TextEditingController eventDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController lastDateToApplyController =
      TextEditingController();
  final TextEditingController institutionNameController =
      TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController eventDescriptionController =
      TextEditingController();

  final ApiProvider api = Get.find();
  final _storage = GetStorage();

  var events = <EventModel>[].obs;
  var jobs = <EventModel>[].obs;
  var internship = <EventModel>[].obs;
  var collageEvent = <EventModel>[].obs;
  var otherEvent = <EventModel>[].obs;
  var isJobLoading = false.obs;
  var isInternshipLoading = false.obs;
  var isCollageEventLoading = false.obs;
  var isOtherEventLoading = false.obs;
  var isEventsloading = false.obs;
  var selectedIndex = 0.obs;
  var selectedEvent = EventModel().obs;
  late EventModel eventModel;

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  void fetchJob() async {
    try {
      isJobLoading(true);
      final response = await api.getApi('/events/job');
      log("hjgj${response.body}");

      final parsed = eventModelFromJson(response.body);
      jobs.value = parsed;
    } catch (error) {
      log("Error fetching job: $error");
    } finally {
      isJobLoading(false);
    }
  }

  void fetchInternship() async {
    try {
      isInternshipLoading(true);
      final response = await api.getApi('/events/internship');
      log("hjgj${response.body}");

      final parsed = eventModelFromJson(response.body);
      internship.value = parsed;

      log("hellooooo${internship[0].eventDate}");
    } catch (error) {
      log("Error fetching internship: $error");
    } finally {
      isInternshipLoading(false);
    }
  }

  void fetchCollageEvent() async {
    try {
      isCollageEventLoading(true);
      final response = await api.getApi('/events/college-events');
      log("hjgj${response.body}");

      final parsed = eventModelFromJson(response.body);
      collageEvent.value = parsed;
    } catch (error) {
      log("Error fetching college events: $error");
    } finally {
      isCollageEventLoading(false);
    }
  }

  void fetchOtherEvent() async {
    try {
      isOtherEventLoading(true);
      final response = await api.getApi('/events/other-events');
      log("hjgj${response.body}");

      final parsed = eventModelFromJson(response.body);
      otherEvent.value = parsed;
    } catch (error) {
      log("Error fetching other events: $error");
    } finally {
      isOtherEventLoading(false);
    }
  }

  void fetchEvents() async {
    try {
      isEventsloading(true);
      final response = await api.getApi('/events/all');
      log("all events${response.body}");
      log("status code${response.statusCode}");
      final parsed = eventModelFromJson(response.body);
      events.value = parsed;
    } catch (error) {
      log("Error fetching events: $error");
    } finally {
      isEventsloading(false);
    }
  }

  void gotoEvent(EventModel eventdata) {
    selectedEvent.value = eventdata;
    Get.toNamed('/feedDetails');
  }

  void launchurl(String url) async {
    final _url = Uri.parse(url);
    try {
      await launchUrl(_url);
    } catch (e) {
      log("error launching url $e");
    }
  }
}
