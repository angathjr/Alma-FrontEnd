import 'dart:developer';
import 'package:alma/auth/controllers/auth_controller.dart';
import 'package:alma/auth/models/user.dart';
import 'package:alma/core/api_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AlumniProfileController extends GetxController {
//controllers of textfield

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController ktuRegController = TextEditingController();
  final TextEditingController currentCompanyController =
      TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController year1Controller = TextEditingController();
  final TextEditingController year2Controller = TextEditingController();

  var user = UserModel().obs;
  final ApiProvider api = Get.find();
  final AuthController authController = Get.find();
  final _storage = GetStorage();
  late UserModel userModel;

  static final List<String> departments = [
    "Computer Science and Engineering",
    "Electronics and Communication Engineering",
    "Electrical and Electronics Engineering",
    "Mechanical Engineering",
    "Civil Engineering",
    "Chemical Engineering",
    "Production Engineering",
    "Architecture",
    "Applied Electronics and Instrumentation",
  ];

  var selectedDepartment = departments.first.obs;

  @override
  void onInit() {
    super.onInit();
    _storage.listenKey('user', (value) {
      user.value = UserModel.fromJson(_storage.read('user'));
    });
    user.value = UserModel.fromJson(_storage.read('user'));
  }

//api calls

  void setAlumni() async {
    Map data = {"user_type": "ALUMNI"};

    try {
      final response =
          await api.putApi('/users/user/${user.value.username}', data);
      log(response.body);
    } catch (e) {
      log(e.toString());
    }
  }

  void registerAlumni() async {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        ktuRegController.text.isEmpty ||
        currentCompanyController.text.isEmpty ||
        departmentController.text.isEmpty ||
        year1Controller.text.isEmpty ||
        year2Controller.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all the fields');
    } else {}
  }

  int getIdofDepartment() {
    int index = departments.indexOf(selectedDepartment.toString());
    return index + 1;
  }

  void updateUser() async {
    userModel = userModel.copyWith(
      firstName: firstNameController.text.trim(),
      lastName: firstNameController.text.trim(),
      phoneNumber: phoneNumberController.text.trim(),
    );

    Map data = {
      "first_name": firstNameController.text,
    };

    try {
      final response = await api.putApi(
          '/users/user/${user.value.username}', userModel.toJson());
      log(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}
