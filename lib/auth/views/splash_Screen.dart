import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void loadPages() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.offNamed('/navBar');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    loadPages();
    return Scaffold(
      body: FractionallySizedBox(
        
        widthFactor: 1,
        heightFactor: 1,
        child: Column(
          children: [
            SizedBox(
              width: width,
              child: Image.asset(
                'assets/images/splash.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
