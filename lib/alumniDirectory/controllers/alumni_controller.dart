import 'dart:developer';
import 'package:alma/core/api_provider.dart';
import 'package:alma/profile/controllers/profile_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/alumni_model.dart';

class AlumniDirController extends GetxController {
  final ApiProvider api = Get.find();
  final ProfileController profileController = Get.find();

  var allAlumni = <AlumniModel>[].obs;
  var alumni = <AlumniModel>[].obs;

  var isLoading = false.obs;
  var isSearching = false.obs;
  final TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void fetchAlumni() async {
    try {
      isLoading(true);
      final response = await api.getApi('/users/alumni');
      final parsed = alumniModelFromJson(response.body);
      allAlumni.value = parsed;
      log("${response.body}");
      isLoading(false);
      alumni.value = allAlumni;
    } catch (e) {
      log("Error fetching alumni: $e");
    } finally {
      isLoading(false);
    }
  }

  void launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    launchUrl(emailLaunchUri);
  }

  void gotoProfile(String username) {
    profileController.selectedUserName.value = username;
    profileController.getUserEventDetails();
  }

  void searchAlumni() {
    if (searchTextController.text.isNotEmpty) {
      isSearching(true);
      alumni.value = allAlumni
          .where((element) => element.user!.firstName!
              .toLowerCase()
              .contains(searchTextController.text.toLowerCase()))
          .toList();
      isSearching(false);
    } else {
      alumni.value = allAlumni;
    }
  }

  void clearControllers() {
    searchTextController.clear();
     Get.back();
  }

}
