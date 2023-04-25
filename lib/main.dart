import 'package:alma/Navbar/views/navbar.dart';
import 'package:alma/profile/views/profileScreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:alma/login/views/StudentProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'getx_di.dart';
import 'login/views/LoginScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  GetXDependancyInjector().onInit();
  Paint.enableDithering = true;
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        //useMaterial3: true,
        fontFamily: 'Helvetica',
      ),
      home: LoginScreen(),
      getPages: [
        GetPage(name: '/', page:()=> LoginScreen()),
        GetPage(name: 'login', page: ()=>LoginScreen()),
      ],
    );
  }
}
