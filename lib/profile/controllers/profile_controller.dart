import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../auth/models/user.dart';

class ProfileController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController interestedAreasController =
      TextEditingController();

  final _storage = GetStorage();

  var user = (UserModel()).obs;

  get selectedImage => null;

  get isImageSelected => null;

  @override
  void onInit() {
    _storage.listenKey('user', (value) {
      user.value = UserModel.fromJson(_storage.read('user'));
    });
    user.value = UserModel.fromJson(_storage.read('user'));
    super.onInit();
  }

  selectImage() {}
}
