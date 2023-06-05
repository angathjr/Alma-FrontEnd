import 'package:alma/registration/controllers/registration_controller.dart';
import 'package:alma/registration/controllers/student_profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';

class StudentProfileScreen extends StatelessWidget {
  StudentProfileScreen({super.key});

  final StudentProfileController controller = Get.find();
  final RegistrationController registrationController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Complete Your Profile'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: width,
              child: SizedBox(
                height: height * .17,
                width: width * 0.3,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Obx(
                      () => CircleAvatar(
                        backgroundImage: AssetImage(
                          "${controller.user.value.imageUrl}",
                        ),
                        foregroundImage:
                            controller.isImageSelected.value == true
                                ? FileImage(controller.selectedImage.value)
                                    as ImageProvider<Object>
                                : AssetImage(
                                    "${controller.user.value.imageUrl}",
                                  ),
                      ),
                    ),
                    Positioned(
                      bottom: height * 0.01,
                      right: width * 0.02,
                      child: Container(
                        alignment: Alignment.center,
                        width: width * 0.09,
                        height: width * 0.09,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            onPressed: () => controller.selectImage(),
                            icon: Icon(
                              Icons.camera_alt,
                              size: width * 0.05,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width * .89,
              height: height * .62,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
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
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Constants.cardColor().withOpacity(0.7)),
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
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Constants.cardColor().withOpacity(0.7)),
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
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Constants.cardColor().withOpacity(0.7)),
                          child: TextFormField(
                            controller: controller.phoneNumberController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "+91",
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
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Constants.cardColor().withOpacity(0.7)),
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
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Constants.cardColor().withOpacity(0.7)),
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
                            fontSize: 14,
                          ),
                        ),
                        Container(
                            width: width * 02,
                            height: height * .053,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Constants.cardColor().withOpacity(0.7)),
                            child: Obx(
                              () => (registrationController
                                          .isdepartmentfetched.value ==
                                      false)
                                  ? const Center(
                                      child: CupertinoActivityIndicator())
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
                          'Acadamic year',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: width * 0.35,
                              height: height * .053,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color:
                                      Constants.cardColor().withOpacity(0.7)),
                              child: TextFormField(
                                controller: controller.year1Controller,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Start",
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
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color:
                                      Constants.cardColor().withOpacity(0.7)),
                              child: TextFormField(
                                controller: controller.year2Controller,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "End",
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
              onTap: () {
                controller.registerStudent();
              },
              child: Container(
                alignment: Alignment.center,
                width: width * 0.35,
                height: height * .053,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Constants.cardColor().withOpacity(0.7)),
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
