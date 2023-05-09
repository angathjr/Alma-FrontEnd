import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: width,
                  child: Image.asset(
                    'assets/images/background.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    controller.handleSignIn();
                  },
                  child: Container(
                    width: width * .75,
                    height: height * .06,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 53, 51, 51),
                              blurRadius: 4,
                              spreadRadius: 2)
                        ],
                        color: const Color.fromARGB(255, 18, 18, 22),
                        border: Border.all(
                            color: const Color.fromARGB(255, 53, 51, 51))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Lottie.asset(
                          'assets/lottie/google.json',
                        ),
                        Obx(
                          () => Text(
                            controller.loginText.value,
                            style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.04,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.03 * height,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: width * 0.055),
                  child: Text(
                    'By continuing you agree ALMA"s Terms of services & Privarcy Policy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.03,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                )
              ],
            ),
            Center(child: Image.asset("assets/images/applogo.png")),
          ],
        ));
  }
}
