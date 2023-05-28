import 'package:alma/core/api_provider_no_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final ApiProviderNoAuth api = Get.find();

  final TextEditingController companyName = TextEditingController();
  final TextEditingController role = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
}
