import 'package:alma/Navbar/views/navbar.dart';
import 'package:alma/auth/views/login_screen.dart';
import 'package:alma/login/views/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'feed/views/feedScreen.dart';
import 'getx_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  GetXDependancyInjector().onInit();
  Paint.enableDithering = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        fontFamily: 'Helvetica',
      ),
      //home: NavBarPage(),
      getPages: [
        GetPage(
            name: '/',
            page: () => storage.hasData('authToken')
                ? storage.read('is_verified') ?? false
                    ? NavBarPage()
                    : const HomeScreen()
                : LoginScreen()),
        // GetPage(name: 'login', page: ()=>LoginScreen()),
      ],
    );
  }
}
