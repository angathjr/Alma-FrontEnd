import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../auth/models/user.dart';

class ProfileController extends GetxController {
  final _storage = GetStorage();

  var user = (UserModel()).obs;

  @override
  void onInit() {
    _storage.listenKey('user', (value) {
      user.value = UserModel.fromJson(_storage.read('user'));
    });
    user.value = UserModel.fromJson(_storage.read('user'));
    super.onInit();
  }
}
