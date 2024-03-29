import 'dart:developer';
import 'package:alma/fcm/controller/fcm_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../core/api_provider.dart';
import '../../core/api_provider_no_auth.dart';
import '../models/user.dart';

class AuthController extends GetxController {
  late GoogleSignIn _googleSignIn;
  final GetStorage _storage = GetStorage();
  final ApiProvider api = Get.find();

  final ApiProviderNoAuth apiNoAuth = Get.find();
  final FcmController fcmController = Get.find();

  var loginText = "Continue with Google".obs;
  var isSigningIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    _googleSignIn = GoogleSignIn();
  }

  void   signout() async {
    await _googleSignIn.signOut();
    await _storage.erase();
    Get.offAllNamed('/login');
  }

  Future<void> handleSignIn() async {
    try {
      loginText.value = "Logging you in ... ";
      isSigningIn(true);
      final result = await _googleSignIn.signIn();
      final auth = await result!.authentication;

      log("access token is ${auth.accessToken}");

      Map data = {'access_token': auth.accessToken};
      final response = await apiNoAuth.postApi('/users/google', data);

      final apiToken = response.body['key'];

      log('Api Token: $apiToken');

      await _storage.write('authToken', apiToken);

      final Response userResponse = await api.getApi('/users/current_user');
      log('${userResponse.statusCode}');

      log("${userResponse.body}");

      final UserModel userModel = userModelFromJson(userResponse.body);

      await _storage.write('user', userModel.toJson());
      log('nameis${userModel.firstName}');

      if (userModel.isVerified ?? false) {
        await _storage.write('isVerified', true);
      } else {
        await _storage.write('isVerified', false);
      }

      //for fcm
      await _storage.write('isDeviceAdded', false);
      fcmController.fetchToken();
      loginText.value = "Logged in ";
      isSigningIn(false);

      Get.offAllNamed('/');
    } catch (error) {
      isSigningIn(false);
      loginText.value = "Try Again";
      await Future.delayed(const Duration(seconds: 2));
      loginText.value = "Continue with Google";
      print(error);
    } finally {
      isSigningIn(false);
      loginText.value = "Continue with Google";
    }
  }

  //to logout
  void logOut() async {
    fcmController.removeDevice();
  }
}
