import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

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

  //pick image
  Rx<File> selectedImage = Rx<File>(File(''));
  var imageUrl = ''.obs;
  var isImageSelected = false.obs;
  var isUpdated = false.obs;

  @override
  void onInit() {
    print("inside profile controller");
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
    if (isImageSelected.value) {
      await uploadImage();
    }
    List<String> areaOfInterest = interestedAreasController.text.split(',');

    try {
      final response = await api.putApi('/users/user/${user.value.username}', {
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'phone_number': phoneNumberController.text,
        'email': mailController.text,
        'bio': bioController.text,
        'area_of_interest': areaOfInterest,
        "img_url": imageUrl.value
      });

      UserModel userdata = UserModel.fromJson(response.body);
      if (response.statusCode == 200) {
        await _storage.write('user', userdata.toJson());
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

  Future<void> uploadImage() async {
    try {
      final storageRef = FirebaseStorage.instance.ref();

      final profileRef =
          storageRef.child('profile-images/${user.value.username}');
      await profileRef.putFile(
        selectedImage.value,
      );
      imageUrl.value = await profileRef.getDownloadURL();
      log(imageUrl.value);
    } catch (e) {
      log("error in uploading img ${e}");
    }
  }
}
