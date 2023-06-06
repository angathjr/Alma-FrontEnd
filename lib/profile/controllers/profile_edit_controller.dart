import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../auth/models/user.dart';
import '../../core/api_provider.dart';

class ProfileEditController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController interestedAreasController = TextEditingController();
  TextEditingController currentCompany = TextEditingController();
  TextEditingController previousCompany = TextEditingController();
  TextEditingController designation = TextEditingController();

  var user = (UserModel()).obs;
  final _storage = GetStorage();
  final ApiProvider api = Get.find();

  var isUpdating = false.obs;
  var submitText = "Submit".obs;

  @override
  void onInit() {
    _storage.listenKey('user', (value) {
      user.value = UserModel.fromJson(_storage.read('user'));
    });
    user.value = UserModel.fromJson(_storage.read('user'));

    currentCompany = TextEditingController(
        text:
            user.value.data!.isEmpty ? "" : user.value.data![0].currentCompany);
    designation = TextEditingController(
        text: user.value.data!.isEmpty ? "" : user.value.data![0].designation);
    firstNameController = TextEditingController(text: user.value.firstName);
    lastNameController = TextEditingController(text: user.value.lastName);
    phoneNumberController = TextEditingController(text: user.value.phoneNumber);
    mailController = TextEditingController(text: user.value.email);
    bioController = TextEditingController(text: user.value.bio);
    interestedAreasController =
        TextEditingController(text: user.value.areaOfInterest?.join(', '));

    previousCompany = TextEditingController(
        text: user.value.data!.isEmpty
            ? ""
            : user.value.data![0].previousCompanies?.join(', '));

    super.onInit();
  }

  void updateGeneralProfile() async {
    isUpdating(true);
    submitText("Updating...");
    List<String> area_of_interest = interestedAreasController.text.split(',');

    try {
      final response = await api.putApi('/users/user/${user.value.username}', {
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'phone_number': phoneNumberController.text,
        'email': mailController.text,
        'bio': bioController.text,
        'area_of_interest': area_of_interest,
      });

      UserModel userdata = UserModel.fromJson(response.body);
      if (response.statusCode == 200) {
        _storage.write('user', userdata.toJson());
        isUpdating(false);
        submitText("Updated");
        Get.back();
      } else {
        Get.snackbar("Error", "Something went wrong");
        submitText("Try Again");
      }
    } catch (e) {
      isUpdating(false);
      submitText("Try Again");
      print(e);
    } finally {
      isUpdating(false);
      submitText("Submit");
    }
  }

  void updateAlumni() async {
    try {
      isUpdating(true);
      submitText("Updating...");
      List<String> previous_companies = previousCompany.text.split(',');
      final response =
          await api.putApi('/users/alumni/${user.value.username}', {
        'current_company': currentCompany.text,
        'previous_companies': previous_companies,
      });
      log("${response.body}");
      isUpdating(false);
      submitText("Updated");
      Get.back();
    } catch (e) {
      isUpdating(false);
      submitText("Try Again");
      print(e);
    } finally {
      isUpdating(false);
      submitText("Submit");
    }
  }

  void updateStaff() async {
    try {
      isUpdating(true);
      submitText("Updating...");
      final response = await api.putApi('/users/staff/${user.value.username}', {
        'designation': designation.text,
      });
      log("${response.body}");
      isUpdating(false);
      submitText("Updated");
      Get.back();
    } catch (e) {
      print(e);
    }
  }
}
