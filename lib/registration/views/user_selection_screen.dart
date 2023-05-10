import 'package:alma/registration/controllers/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSelectionScreen extends StatelessWidget {
  UserSelectionScreen({Key? key}) : super(key: key);

  final RegistrationController regController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Who are you?',
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                regController.setAlumni();
                
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.2,
                    width: width * 0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/graduation 1.png')),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff13141B)),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(57, 130, 20, 5),
                      child: Text('Alumni'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    regController.setStaff();
                  },
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/male 1.png')),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff13141B)),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(57, 130, 20, 5),
                      child: Text('Staff'),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    regController.setStudent();
                  },
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/boy 1.png')),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff13141B)),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(57, 130, 20, 5),
                      child: Text('Student'),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
