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
    Map data = {"user_type": "ALUMNI", "username": user.value.username};

    try {
      final response =
          await api.putApi('/users/user/10', data);
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
    } else {
      var data = {
        "user": {
        
          "first_name": firstNameController.text,
          "last_name": lastNameController.text,
          "is_verified": true,
          "user_type": "ALUMNI",
          "phone_number": phoneNumberController.text,
        },
        "year_of_graduate": year1Controller.text,
        "previous_companies": "hgty",
        "current_company": currentCompanyController.text,
        "academic_year_from": year1Controller.text,
        "academic_year_to": year2Controller.text,
        "department": 1
      };

      //TODO: change the url

      final response =
          await api.putApi('/users/alumni/5}', data);
      log(response.body);
    }
  }
}
