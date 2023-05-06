import 'package:alma/registration/controllers/staff_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffProfileScreen extends StatelessWidget {
  StaffProfileScreen({super.key});

  final StaffProfileController controller = Get.find();

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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xff25262E),
                            ),
                            child: TextFormField(
                              controller: controller.last_name_controller,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xff25262E),
                            ),
                            child: TextFormField(
                              controller: controller.phone_number_controller,
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
                            'TKM Mail id',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Container(
                            width: width * 02,
                            height: height * .053,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xff25262E),
                            ),
                            child: TextFormField(
                              controller: controller.tkm_mail_controller,
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
                            'Staff id',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Container(
                            width: width * 02,
                            height: height * .053,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xff25262E),
                            ),
                            child: TextFormField(
                              controller: controller.staff_id_controller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 5),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: width * 0.08,
                          ),
                          const Text(
                            'Designation',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Container(
                            width: width * 02,
                            height: height * .053,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xff25262E),
                            ),
                            child: TextFormField(
                              controller: controller.designation_controller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 5),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: width * 0.08,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xff25262E),
                            ),
                            child: TextFormField(
                              controller: controller.department_controller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 5),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: width * 0.05,
            ),
            Container(
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
          ],
        ),
      ),
    );
  }
}
