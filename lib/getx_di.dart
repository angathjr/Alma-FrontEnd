import 'package:alma/eventCalendar/controllers/calendar_controller.dart';
import 'package:alma/registration/controllers/alumni_profile_controller.dart';
import 'package:alma/registration/controllers/staff_profile_controller.dart';
import 'package:alma/registration/controllers/student_profile_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'auth/controllers/auth_controller.dart';
import 'core/api_provider.dart';
import 'core/api_provider_no_auth.dart';

class GetXDependancyInjector {
  void onInit() {
    Get.put(ApiProvider());
    Get.put(ApiProviderNoAuth());
    Get.put(AuthController());
    Get.put(GetStorage());
    Get.lazyPut(() => AlumniProfileController(), fenix: true);
    Get.lazyPut(() => StaffProfileController(), fenix: true);
    Get.lazyPut(() => StudentProfileController(), fenix: true);
    Get.lazyPut(() => EventCalendarController(), fenix: true);
  }
}
