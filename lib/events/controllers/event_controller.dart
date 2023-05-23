import 'dart:developer';
import 'package:alma/core/api_provider_no_auth.dart';
import 'package:alma/events/models/event_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../auth/models/user.dart';

class EventsController extends GetxController {
 final TextEditingController companyNameController =TextEditingController();
 final TextEditingController eventNameController =TextEditingController();
 final TextEditingController eventTypeController =TextEditingController();
 final TextEditingController eventDateController=TextEditingController();
 final TextEditingController descriptionController=TextEditingController();
 final TextEditingController endDateController =TextEditingController();
 final TextEditingController lastDateToApplyController =TextEditingController();
 final TextEditingController institutionNameController =TextEditingController();
 final TextEditingController roleController =TextEditingController();
 final TextEditingController eventDescriptionController =TextEditingController();

  var events = <EventModel>[].obs;
  var jobs = <EventModel>[].obs;
  //List<EventModel> get jobs => jobs.value;
 
  final ApiProviderNoAuth api = Get.find();
   final _storage = GetStorage();
  late EventModel eventModel;

  void fetchJob (String? eventName )async
{
final response = await api.getApi('/events/job');
log("guyguyS${response.body}");

final parsed = eventModelFromJson(response.body);
jobs.value=parsed;
//print(jobs[0].eventName);
log("shanil${jobs[0].eventName}");
//_jobs.add(eventModel());

}

}
    
   