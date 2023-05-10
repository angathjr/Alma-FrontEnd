import 'dart:developer';
import 'package:alma/auth/controllers/auth_controller.dart';
import 'package:alma/auth/models/user.dart';
import 'package:alma/core/api_provider.dart';
import 'package:alma/registration/controllers/registration_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class StudentProfileController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController tkmMailController = TextEditingController();
  final TextEditingController admNoController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  var user = UserModel().obs;
  final ApiProvider api = Get.find();
  final AuthController authController = Get.find();
  final RegistrationController registrationController = Get.find();
  final _storage = GetStorage();
  late UserModel userModel;

  @override
  void onInit() {
    super.onInit();
    _storage.listenKey('user', (value) {
      user.value = UserModel.fromJson(_storage.read('user'));
    });
    user.value = UserModel.fromJson(_storage.read('user'));
    userModel = user.value;
    log("${user.value.username}");
  }

  //api calls

  void registerStudent() async {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        tkmMailController.text.isEmpty ||
        tkmMailController.text.isEmpty ||
        admNoController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all the fields');
    } else {
      UserData student = user.value.data![0];

      student = student.copyWith(
        tkmMail: tkmMailController.text,
        department: getIdofDepartment(),
      );
      try {
        final response = await api.putApi(
            '/users/student/${user.value.username}', student.toJson());
        log("student  response is ${response.body}");

        if (response.statusCode == 200) {
          userModel = UserModel.fromJson(response.body);
          await _storage.write('user', userModel.toJson());
          await _storage.write('isVerified', true);
          log("new user model is ${userModel.toJson()}");
          Get.offAllNamed('/');
        } else {
          Get.snackbar("Error", "${response.body["tkm_mail"][0]}");
        }
      } catch (e) {
        log(e.toString());
        // Get.snackbar("Error", e.toString());
      }
    }
  }

//to update common user fields

  void updateUser() async {
    userModel = userModel.copyWith(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        isVerified: true);

    try {
      final response = await api.putApi(
          '/users/user/${user.value.username}', userModel.toJson());
      log("response user is ${response.body}");
      if (response.statusCode == 200) {
        registerStudent();
      } else {
        Get.snackbar("Error", "${response.body["phone_number"][0]}");
      }
    } catch (e) {
      log("catch ${e.toString()}");
    }
  }

  //to get department index
  int getIdofDepartment() {
    int index = registrationController.depNames
        .indexOf(registrationController.selectedDepartment.toString());
    return index + 1;
  }
}
