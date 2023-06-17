import 'package:alma/auth/controllers/auth_controller.dart';
import 'package:alma/registration/controllers/registration_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants.dart';

class UserSelectionScreen extends StatelessWidget {
  UserSelectionScreen({Key? key}) : super(key: key);

  final RegistrationController regController = Get.find();
  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              authController.logOut();
            },
            icon: const Icon(Iconsax.logout))
      ]),
      body: Obx(
        () => regController.isUpdating.value
            ? const Center(child: CupertinoActivityIndicator())
            : Center(
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
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/graduation 1.png')),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Constants.cardColor().withOpacity(0.7)),
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
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/male 1.png')),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Constants.cardColor().withOpacity(0.7)),
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
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/boy 1.png')),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Constants.cardColor().withOpacity(0.7)),
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
      ),
    );
  }
}
