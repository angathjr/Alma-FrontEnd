import 'dart:developer';
import 'dart:io';
import 'package:alma/auth/controllers/auth_controller.dart';
import 'package:alma/auth/models/user.dart';
import 'package:alma/core/api_provider.dart';
import 'package:alma/registration/controllers/registration_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class AlumniProfileController extends GetxController {
  final ApiProvider api = Get.find();
  final AuthController authController = Get.find();
  final RegistrationController registrationController = Get.find();
  final _storage = GetStorage();

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
  late UserModel userModel;
  Rx<File> selectedImage = Rx<File>(File(''));
  var imageUrl = ''.obs;
  var isImageSelected = false.obs;
  var isUpdating = false.obs;
  var submitText = "Submit".obs;

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

  void registerAlumni() async {
    // UserData alumni = user.value.data![0];

    // alumni = alumni.copyWith(
    //     department: getIdofDepartment(),
    //     currentCompany: currentCompanyController.text,
    //     academicYearFrom: int.parse(year1Controller.text),
    //     academicYearTo: int.parse(year2Controller.text),
    //     user: user.value.id);

    Map<String, dynamic> data = {
      "department": getIdofDepartment(),
      "current_company": currentCompanyController.text,
      "academic_year_from": int.parse(year1Controller.text),
      "academic_year_to": int.parse(year2Controller.text),
      "user": user.value.id
    };

    try {
      final response =
          await api.putApi('/users/alumni/${user.value.username}', data);

      log("alumni response is ${response.body}");
      if (response.statusCode == 200) {
        isImageSelected.value
            ? uploadImage()
            : Get.snackbar("Profile Image", "please choose your Profile image");
      } else {
        Get.snackbar("Error", "${response.body['error']}");
        submitText.value = "Submit";
      }
      submitText.value = "Done";
      isUpdating(false);
    } catch (e) {
      isUpdating(false);
      submitText.value = "Try Again";
      Future.delayed(const Duration(seconds: 2), () {
        submitText.value = "Submit";
      });
      log(e.toString());
    }
  }

  int getIdofDepartment() {
    int index = registrationController.depNames
        .indexOf(registrationController.selectedDepartment.toString());
    return index + 1;
  }

  void updateUser() async {
    isUpdating(true);
    submitText.value = "Updating...";
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        ktuRegController.text.isEmpty ||
        currentCompanyController.text.isEmpty ||
        year1Controller.text.isEmpty ||
        year2Controller.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all the fields');
    } else {
      userModel = userModel.copyWith(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        imageUrl: imageUrl.value,
      );

      try {
        final response = await api.putApi(
            '/users/user/${user.value.username}', userModel.toJson());
        log("user response${response.body}");
        if (response.statusCode == 200) {
          registerAlumni();
        } else {
          Get.snackbar("Error", "${response.body["phone_number"][0]}");
          submitText.value = "Submit";
        }
      } catch (e) {
        isUpdating(false);
        submitText.value = "Try Again";
        Future.delayed(const Duration(seconds: 2), () {
          submitText.value = "Submit";
        });
        log(e.toString());
      }
    }
  }

  void updateVerification() async {
    userModel = userModel.copyWith(isVerified: true);

    try {
      final response = await api.putApi(
          '/users/user/${user.value.username}', userModel.toJson());
      log("user response${response.body}");
      if (response.statusCode == 200) {
        // userModel = UserModel.fromJson(response.body);
        await _storage.write('user', userModel.toJson());
        await _storage.write('isVerified', true);
        log("new user model is ${userModel.toJson()}");
        isUpdating(true);
        Get.offAllNamed('/');
      } else {
        Get.snackbar("Error", "${response.body["phone_number"][0]}");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  //to pick image

  void selectImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image =
          await picker.pickImage(source: ImageSource.gallery, imageQuality: 60);
      if (image == null) return;
      selectedImage.value = File(image.path);
      isImageSelected(true);
      if (kDebugMode) {
        log("image location is ${selectedImage.value}");
      }
    } on PlatformException catch (e) {
      print("failed to pick image $e");
    }
  }

  void uploadImage() async {
    try {
      final storageRef = FirebaseStorage.instance.ref();

      final profileRef =
          storageRef.child('profile-images/${user.value.username}');
      await profileRef.putFile(
        selectedImage.value,
      );
      imageUrl.value = await profileRef.getDownloadURL();
      updateVerification();

      log(imageUrl.value);
    } catch (e) {
      log("error in uploading img ${e}");
    }
  }
}
