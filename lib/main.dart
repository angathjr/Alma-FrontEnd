
import 'package:alma/login/views/StudentProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



void main(){
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
      home:const StudentProfileScreen(),
    );
  }
}
