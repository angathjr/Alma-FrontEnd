import 'package:alma/Internship/views/InternshipScreen.dart';
import 'package:alma/Navbar/views/navbar.dart';
import 'package:alma/Post/views/InternshipDescriptionScreen.dart';
import 'package:alma/Post/views/JobDescriptionScreen.dart';
import 'package:alma/auth/views/splash_Screen.dart';
import 'package:alma/eventCalendar/views/calendar_screen.dart';
import 'package:alma/jobs/views/JobScreen.dart';
import 'package:alma/profile/views/profileEditScreen.dart';
import 'package:alma/registration/views/alumni_profile_screen.dart';
import 'package:alma/registration/views/user_selection_screen.dart';
import 'package:alma/registration/views/staff_profile_screen.dart';
import 'package:alma/registration/views/student_profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Post/views/CollageEventDescription.dart';
import 'Post/views/OtherEventDescription.dart';
import 'auth/views/login_screen.dart';
import 'events/views/CollageEvents.dart';
import 'events/views/OtherEvent.dart';
import 'events/views/event_details_screen.dart';
import 'getx_di.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

const AndroidNotificationChannel notificationChannel =
    AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  description: 'This channel is used for important notifications',
  importance: Importance.high,
  playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await GetStorage.init();
  GetXDependancyInjector().onInit();

  Paint.enableDithering = true;

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(notificationChannel);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
          brightness: Brightness.dark,
          useMaterial3: true,
          fontFamily: 'Helvetica',
          appBarTheme: const AppBarTheme(scrolledUnderElevation: 0,backgroundColor: Colors.black)),
      initialRoute: '/splash',
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
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/internship-page', page: () => InternshipScreen()),
        GetPage(name: '/collageEvent-page', page: () => CollageEventScreen()),
        GetPage(name: '/otherEvent-page', page: () => OtherEventScreen()),
        GetPage(
            name: '/collageEventdes-description',
            page: () => CollageEventDescriptionScreen()),
        GetPage(
            name: '/otherEventdes-description',
            page: () => OtherEventDescriptionScreen()),
        GetPage(name: '/EditProfile', page: () => ProfileEditScreen()),
         GetPage(name: '/feedDetails', page: () => EventDetailsScreen()),
      ],
    );
  }
}
