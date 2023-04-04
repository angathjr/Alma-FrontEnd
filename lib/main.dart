import 'package:alma/Navbar/views/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  Paint.enableDithering = true;
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: NavBarPage(),
    );
  }
}
