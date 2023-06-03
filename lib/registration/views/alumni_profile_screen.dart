import 'package:alma/core/constants.dart';
import 'package:alma/registration/controllers/alumni_profile_controller.dart';
import 'package:alma/registration/controllers/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlumniProfileScreen extends StatelessWidget {
  AlumniProfileScreen({super.key});

  final AlumniProfileController controller = Get.find();
  final RegistrationController regController = Get.find();

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
                        backgroundImage: const AssetImage(
                          NOIMAGE,
                        ),
                        foregroundImage:
                            controller.isImageSelected.value == true
                                ? FileImage(controller.selectedImage.value)
                                    as ImageProvider<Object>
                                : const AssetImage(NOIMAGE),
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
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const BouncingScrollPhysics(),
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
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                           color: Constants.cardColor().withOpacity(0.7)
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
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                           color: Constants.cardColor().withOpacity(0.7)
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
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                           color: Constants.cardColor().withOpacity(0.7)
                          ),
                          child: TextFormField(
                            
                            controller: controller.phoneNumberController,
                            
                            decoration: const InputDecoration(
                              hintText: '+91 ',
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
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Constants.cardColor().withOpacity(0.7)
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
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                           color: Constants.cardColor().withOpacity(0.7),
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
                            decoration:  BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Constants.cardColor().withOpacity(0.7)
                            ),
                            child: Obx(
                              () => (regController.isdepartmentfetched.value ==
                                      false)
                                  ? Center(child: CircularProgressIndicator())
                                  : DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButton(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          isExpanded: true,
                                          isDense: false,
                                          value: regController
                                              .selectedDepartment.value,
                                          elevation: 0,
                                          items: regController.depNames
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
                                            regController.selectedDepartment
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
                            fontSize: 12,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: width * 0.35,
                              height: height * .053,
                              decoration:  BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Constants.cardColor().withOpacity(0.7)
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: controller.year1Controller,
                                decoration: const InputDecoration(
                                  hintText: "start",
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
                              decoration:  BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                 color: Constants.cardColor().withOpacity(0.7)
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: controller.year2Controller,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "end",
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
            InkWell(
              onTap: () {
                controller.updateUser();
              },
              child: Container(
                width: width * 0.35,
                height: height * .053,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Constants.cardColor().withOpacity(0.7)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        controller.submitText.value,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
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
