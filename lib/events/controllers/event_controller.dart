import 'dart:developer';
import 'package:alma/core/api_provider_no_auth.dart';
import 'package:alma/events/models/event_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';



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



  final ApiProviderNoAuth api = Get.find();
  final _storage = GetStorage();



  var events = <EventModel>[].obs;
  var jobs = <EventModel>[].obs;
  var internship = <EventModel>[].obs;
   var collageEvent = <EventModel>[].obs;
   var otherEvent = <EventModel>[].obs;
  var isJobLoading=false.obs;
  var isInternshipLoading=false.obs;
  var isCollageEventLoading=false.obs;
  var isOtherEventLoading=false.obs;


  late EventModel eventModel;



  void fetchJob() async {
    isJobLoading(true);
    final response = await api.getApi('/events/job');
    log("hjgj${response.body}");

    final parsed = eventModelFromJson(response.body);
    jobs.value = parsed;

    isJobLoading(false);
  }

  void fetchInternship() async {
    isInternshipLoading(true);
    final response = await api.getApi('/events/internship');
    log("hjgj${response.body}");

    final parsed = eventModelFromJson(response.body);
    internship.value = parsed;

    log("hellooooo${internship[0].eventDate}");
    isInternshipLoading(false); 
  }


  void fetchCollageEvent() async {
    isCollageEventLoading(true);
    final response = await api.getApi('/events/college-events');
    log("hjgj${response.body}");

    final parsed = eventModelFromJson(response.body);
    collageEvent.value = parsed;

   
    isCollageEventLoading(false); 
  }

   void fetchOtherEvent() async {
    isOtherEventLoading(true);
    final response = await api.getApi('/events/other-events');
    log("hjgj${response.body}");

    final parsed = eventModelFromJson(response.body);
    otherEvent.value = parsed;

   
    isOtherEventLoading(false); 
  }
}


