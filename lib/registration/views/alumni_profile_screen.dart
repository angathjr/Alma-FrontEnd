import 'dart:math';

import 'package:alma/auth/models/user.dart';
import 'package:alma/registration/controllers/alumni_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AlumniProfileScreen extends StatelessWidget {
  AlumniProfileScreen({super.key});

  final AlumniProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Complete Your Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/pic.png',
              height: height * .15,
              scale: 1.1,
            ),
            Container(
              width: width * .89,
              height: height * .62,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff13141B),
              ),
              child: Padding(
                padding: EdgeInsets.all(width * 0.06),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'First Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff25262E),
                          ),
                          child: TextFormField(
                            controller: controller.firstNameController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.06,
                        ),
                        const Text(
                          'Last Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff25262E),
                          ),
                          child: TextFormField(
                            controller: controller.lastNameController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.06,
                        ),
                        const Text(
                          'Phone Number',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff25262E),
                          ),
                          child: TextFormField(
                            controller: controller.phoneNumberController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.06,
                        ),
                        const Text(
                          'KTU Reg Number',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff25262E),
                          ),
                          child: TextFormField(
                            controller: controller.ktuRegController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.06,
                        ),
                        const Text(
                          'Current Company',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff25262E),
                          ),
                          child: TextFormField(
                            controller: controller.currentCompanyController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.06,
                        ),
                        const Text(
                          'Department',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff25262E),
                          ),
                          child: TextFormField(
                            controller: controller.departmentController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.08,
                        ),
                        const Text(
                          'Acadamic year',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: width * 0.35,
                              height: height * .053,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xff25262E),
                              ),
                              child: TextFormField(
                                controller: controller.year1Controller,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 5),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.05,
                            ),
                            Container(
                              width: width * 0.35,
                              height: height * .053,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xff25262E),
                              ),
                              child: TextFormField(
                                controller: controller.year2Controller,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 5),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: width * 0.05,
            ),
            GestureDetector(
              onTap: () => controller.registerAlumni(),
              child: Container(
                width: width * 0.35,
                height: height * .053,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xff25262E),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
