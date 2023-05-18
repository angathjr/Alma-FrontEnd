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

class StaffProfileController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController tkmMailController = TextEditingController();
  final TextEditingController joinedYearController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController designationController = TextEditingController();

  var user = UserModel().obs;
  final ApiProvider api = Get.find();
  final AuthController authController = Get.find();
  final RegistrationController registrationController = Get.find();
  final _storage = GetStorage();
  late UserModel userModel;

  Rx<File> selectedImage = Rx<File>(File(''));
  var imageUrl = ''.obs;
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

//to update staff detials
  void registerStaff() async {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        tkmMailController.text.isEmpty ||
        joinedYearController.text.isEmpty ||
        designationController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all the fields');
    } else {
      UserData staff = user.value.data!.first;
      staff = staff.copyWith(
          joinedYear: int.parse(joinedYearController.text),
          designation: designationController.text,
          tkmMail: tkmMailController.text,
          department: getIdofDepartment());

      try {
        final response = await api.putApi(
            '/users/staff/${user.value.username}', staff.toJson());
        log("staff response is ${response.body}");
        if (response.statusCode == 200) {
          // userModel = UserModel.fromJson(response.body);
          isImageSelected.value
              ? uploadImage()
              : Get.snackbar(
                  "Profile Image", "please choose your Profile image");
        } else {
          Get.snackbar("Error", "${response.body}");
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }

//to update common user details

  void updateUser() async {
    userModel = userModel.copyWith(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        imageUrl: imageUrl.value,
        isVerified: true);

    try {
      final response = await api.putApi(
          '/users/user/${user.value.username}', userModel.toJson());
      log("user response${response.body}");
      if (response.statusCode == 200) {
        userModel = UserModel.fromJson(response.body);
        await _storage.write('user', userModel.toJson());
        await _storage.write('isVerified', true);
        log("new user model is ${userModel.toJson()}");
        Get.offAllNamed('/');
      } else {
        Get.snackbar("Error", "${response.body["phone_number"][0]}");
      }
    } catch (e) {
      log(e.toString());
    }
  }

//to get department index
  int getIdofDepartment() {
    int index = registrationController.depNames
        .indexOf(registrationController.selectedDepartment.toString());
    return index + 1;
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
      updateUser();

      log(imageUrl.value);
    } catch (e) {
      log("error in uploading img ${e}");
    }
  }
}
