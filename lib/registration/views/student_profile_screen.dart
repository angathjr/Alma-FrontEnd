import 'package:alma/registration/controllers/registration_controller.dart';
import 'package:alma/registration/controllers/student_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentProfileScreen extends StatelessWidget {
  StudentProfileScreen({super.key});

  final StudentProfileController controller = Get.find();
  final RegistrationController registrationController = Get.find();

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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff25262E),
                          ),
                          child: TextFormField(
                            controller: controller.phoneNumberController,
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
                          'Tkm Mail id',
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
                            controller: controller.tkmMailController,
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
                          'Admission number',
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
                            controller: controller.admNoController,
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
                            child: Obx(
                              () => (registrationController
                                          .isdepartmentfetched.value ==
                                      false)
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButton(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          isExpanded: true,
                                          isDense: false,
                                          value: registrationController
                                              .selectedDepartment.value,
                                          elevation: 0,
                                          items: registrationController.depNames
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem(
                                              value: value,
                                              child: Text(value,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: width * 0.037)),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            registrationController
                                                .selectedDepartment
                                                .value = value.toString();
                                          },
                                        ),
                                      ),
                                    ),
                            )),
                        SizedBox(
                          height: width * 0.08,
                        ),
                        const Text(
                          'Year of study',
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
                            controller: controller.yearController,
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
            SizedBox(
              height: width * 0.05,
            ),
            GestureDetector(
              onTap: () {
                  controller.updateUser();
              },
              child: Container(
                alignment: Alignment.center,
                width: width * 0.35,
                height: height * .053,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xff25262E),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
