import 'package:alma/Internship/views/InternshipScreen.dart';
import 'package:alma/Navbar/views/navbar.dart';
import 'package:alma/Post/views/InternshipDescriptionScreen.dart';
import 'package:alma/Post/views/JobDescriptionScreen.dart';
import 'package:alma/Post/views/postScreen.dart';
import 'package:alma/auth/views/spalash_Screen.dart';
import 'package:alma/eventCalendar/views/calendar_screen.dart';
import 'package:alma/jobs/views/JobScreen.dart';
import 'package:alma/profile/views/profileScreen.dart';
import 'package:alma/registration/views/alumni_profile_screen.dart';
import 'package:alma/registration/views/user_selection_screen.dart';
import 'package:alma/registration/views/staff_profile_screen.dart';
import 'package:alma/registration/views/student_profile_screen.dart';
import 'package:alma/search/views/searchScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Internship/views/InternshipDetailsScreen.dart';
import 'auth/views/login_screen.dart';
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
      home: InternshipDetailsScreen(),
      getPages: [
        GetPage(
            name: '/',
            page: () => storage.hasData('authToken')
                ? storage.read('isVerified') ?? false
                    ? NavBarPage()
                    : UserSelectionScreen()
                : LoginScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/alumni-profile', page: () => AlumniProfileScreen()),
        GetPage(name: '/staff-profile', page: () => StaffProfileScreen()),
        GetPage(name: '/student-profile', page: () => StudentProfileScreen()),
        GetPage(name: '/job-description', page: () => JobDescriptionScreen()),
        GetPage(
            name: '/internship-description',
            page: () => InternshipDescriptionScreen()),
        GetPage(name: '/calender-page', page: () => CalendarScreen()),
        GetPage(name: '/job-page', page: () => JobScreen()),
        GetPage(name: '/internship-page', page: () => InternshipScreen()),
      ],
    );
  }
}
