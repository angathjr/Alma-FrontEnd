import 'dart:developer';

import 'package:alma/core/api_provider.dart';
import 'package:alma/events/models/department_model.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../auth/controllers/auth_controller.dart';
import '../../auth/models/user.dart';

class RegistrationController extends GetxController {
  final ApiProvider api = Get.find();
  final AuthController authController = Get.find();
  final _storage = GetStorage();

  late UserModel userModel;
  var user = UserModel().obs;
  var departments = <DepartmentModel>[].obs;
  var isdepartmentfetched = false.obs;
  var depNames = <String>[].obs;
  var selectedDepartment = "".obs;
  var isUpdating = false.obs;

  @override
  void onInit() {
    super.onInit();
    _storage.listenKey('user', (value) {
      user.value = UserModel.fromJson(_storage.read('user'));
    });
    user.value = UserModel.fromJson(_storage.read('user'));
    userModel = user.value;
    log("username is ${user.value.username}");
    fetchDepartments();
  }

  void setAlumni() async {
    Map data = {"user_type": "ALUMNI"};

    try {
      isUpdating(true);
      final response =
          await api.putApi('/users/user/${user.value.username}', data);
      final parsed = UserModel.fromJson(response.body);
      await _storage.write('user', parsed.toJson());
      // userModel = parsed;
      log("response is ${response.body}");
      Get.toNamed('/alumni-profile');
      isUpdating(false);
    } catch (e) {
      log("error${e.toString()}");
    }
  }

  void setStudent() async {
    Map data = {"user_type": "STUDENT"};

    try {
      isUpdating(true);
      final response =
          await api.putApi('/users/user/${user.value.username}', data);
      final parsed = UserModel.fromJson(response.body);
      await _storage.write('user', parsed.toJson());
      // userModel = parsed;
      log("${response.body}");
      
      Get.toNamed('/student-profile');
      isUpdating(false);
    } catch (e) {
      log(e.toString());
    }
  }

  void setStaff() async {
    Map data = {"user_type": "STAFF"};

    try {
      isUpdating(true);
      final response =
          await api.putApi('/users/user/${user.value.username}', data);
      final parsed = UserModel.fromJson(response.body);
      await _storage.write('user', parsed.toJson());
      // userModel = parsed;
      log("${response.body}");
      Get.toNamed('/staff-profile');
      isUpdating(false);
    } catch (e) {
      log(e.toString());
    }
  }

  void fetchDepartments() async {
    isdepartmentfetched(false);
    final response = await api.getApi('/users/department');
    log(response.body.toString());
    final parsed = departmentModelFromJson(response.body);
    departments.value = parsed;
    depNames.value = departments.map((e) => e.depName).toList();
    selectedDepartment.value = depNames.first;
    isdepartmentfetched(true);
  }
}
