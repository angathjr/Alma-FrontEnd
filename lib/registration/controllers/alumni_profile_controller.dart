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
  final RegistrationController registrationController = Get.find();
  final _storage = GetStorage();
  late UserModel userModel;
  Rx<File> selectedImage = Rx<File>(File(''));

  var isImageSelected = false.obs;

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
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        ktuRegController.text.isEmpty ||
        currentCompanyController.text.isEmpty ||
        year1Controller.text.isEmpty ||
        year2Controller.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all the fields');
    } else {
      UserData alumni = user.value.data![0];

      alumni = alumni.copyWith(
        department: getIdofDepartment(),
        currentCompany: currentCompanyController.text,
        academicYearFrom: int.parse(year1Controller.text),
        academicYearTo: int.parse(year2Controller.text),
      );

      try {
        final response = await api.putApi(
            '/users/alumni/${user.value.username}', alumni.toJson());

        log("alumni response is ${response.body}");
        if (response.statusCode == 200) {
          userModel = UserModel.fromJson(response.body);
          await _storage.write('user', userModel.toJson());
          await _storage.write('isVerified', true);
          log("new user model is ${userModel.toJson()}");
          Get.offAllNamed('/');
        } else {
          Get.snackbar("Error", "${response.body}");
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }

  int getIdofDepartment() {
    int index = registrationController.depNames
        .indexOf(registrationController.selectedDepartment.toString());
    return index + 1;
  }

  void updateUser() async {
    userModel = userModel.copyWith(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        isVerified: true);

    try {
      final response = await api.putApi(
          '/users/user/${user.value.username}', userModel.toJson());
      log("user response${response.body}");
      if (response.statusCode == 200) {
        registerAlumni();
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
      final StorageRef = FirebaseStorage.instance.ref();

      final profileRef =
          StorageRef.child('profile-images/${user.value.username}');
      await profileRef.putFile(
        selectedImage.value,
      );
      final imageUrl = await profileRef.getDownloadURL();

      log(imageUrl);
    } catch (e) {
      log("error in uploading img ${e}");
    }
  }
}
