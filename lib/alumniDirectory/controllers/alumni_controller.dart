import 'dart:developer';
import 'package:alma/auth/models/user.dart';
import 'package:alma/core/api_provider.dart';
import 'package:alma/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/alumni_model.dart';

class AlumniDirController extends GetxController {
  final ApiProvider api = Get.find();
  final ProfileController profileController = Get.find();

  var alumni = <AlumniModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void fetchAlumni() async {
    try {
      isLoading(true);
      final response = await api.getApi('/users/alumni');
      final parsed = alumniModelFromJson(response.body);
      alumni.value = parsed;
      log("${response.body}");
      isLoading(false);
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


  void gotoProfile(String username){
    profileController.selectedUserName.value =username;
    profileController.getUserEventDetails();
  }

}
