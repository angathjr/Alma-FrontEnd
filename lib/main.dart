import 'package:alma/Internship/views/InternshipDetailsScreen.dart';
import 'package:alma/Internship/views/InternshipScreen.dart';
import 'package:alma/Navbar/views/navbar.dart';
import 'package:alma/Post/views/InternshipDescriptionScreen.dart';
import 'package:alma/Post/views/JobDescriptionScreen.dart';
import 'package:alma/auth/views/login_screen.dart';
import 'package:alma/feed/views/feedDetailScreen.dart';
import 'package:alma/feed/views/feedScreen.dart';
import 'package:alma/jobs/views/JobScreen.dart';
import 'package:alma/login/views/AlumniProfileScreen.dart';
import 'package:alma/login/views/HomeScreen.dart';
import 'package:alma/login/views/StaffProfileScreen.dart';
import 'package:alma/login/views/StudentProfileScreen.dart';
import 'package:alma/profile/views/profileScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
      home: feedDetailedScreen(),
      //getPages: [
      //  GetPage(
         //   name: '/',
         //   page: () => storage.hasData('authToken')
         //       ? storage.read('isVerified') ?? false
          //          ? NavBarPage()
           //         :  HomeScreen()
           //     : LoginScreen()),
        // GetPage(name: 'login', page: ()=>LoginScreen()),
      //],
    );
  }
}
