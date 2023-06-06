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

  var user = (UserModel()).obs;
  final _storage = GetStorage();
  final ApiProvider api = Get.find();

  @override
  void onInit() {
    _storage.listenKey('user', (value) {
      user.value = UserModel.fromJson(_storage.read('user'));
    });
    user.value = UserModel.fromJson(_storage.read('user'));
    firstNameController = TextEditingController(text: user.value.firstName);
    lastNameController = TextEditingController(text: user.value.lastName);
    phoneNumberController = TextEditingController(text: user.value.phoneNumber);
    mailController = TextEditingController(text: user.value.email);
    bioController = TextEditingController(text: user.value.bio);
    interestedAreasController =
        TextEditingController(text: user.value.areaOfInterest?.join(', '));

    super.onInit();
  }

  void updateGeneralProfile() async {
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
        Get.back();
      }
    } catch (e) {
      print(e);
    }
  }
}
