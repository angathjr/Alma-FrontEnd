import 'package:alma/Post/controllers/post_controller.dart';
import 'package:alma/eventCalendar/controllers/calendar_controller.dart';
import 'package:alma/fcm/controller/fcm_controller.dart';
import 'package:alma/profile/controllers/profile_controller.dart';
import 'package:alma/registration/controllers/alumni_profile_controller.dart';
import 'package:alma/registration/controllers/registration_controller.dart';
import 'package:alma/registration/controllers/staff_profile_controller.dart';
import 'package:alma/registration/controllers/student_profile_controller.dart';
import 'package:alma/events/controllers/event_controller.dart';
import 'package:alma/search/controllers/search_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'auth/controllers/auth_controller.dart';
import 'core/api_provider.dart';
import 'core/api_provider_no_auth.dart';

class GetXDependancyInjector {
  void onInit() {
    Get.put(GetStorage());
    Get.put(ApiProvider());
    Get.put(FcmController());
    Get.put(ApiProviderNoAuth());
    Get.put(AuthController());
    Get.lazyPut(() => EventsController(), fenix: true);
    Get.lazyPut(() => RegistrationController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => AlumniProfileController(), fenix: true);
    Get.lazyPut(() => StaffProfileController(), fenix: true);
    Get.lazyPut(() => StudentProfileController(), fenix: true);
    Get.lazyPut(() => EventCalendarController(), fenix: true);
    Get.lazyPut(() => EventSearchController(), fenix: true);
    Get.lazyPut(() => PostController(), fenix: true);
  }
}
