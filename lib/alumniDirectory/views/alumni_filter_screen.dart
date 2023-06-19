import 'package:alma/alumniDirectory/controllers/alumni_dir_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/constants.dart';
import '../../registration/controllers/registration_controller.dart';

class AlumniFilterScreen extends StatelessWidget {
  AlumniFilterScreen({super.key});

  final AlumniDirController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.35,
      width: width,
      decoration: BoxDecoration(
        color: Constants.cardColor(),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Filter By",
                style: TextStyle(fontSize: width * 0.06),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.08, vertical: width * 0.05),
                width: width,
                child: Column(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      DialogueWidget1());
                            },
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: height,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Year",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width * 0.05,
                                          color: Colors.white),
                                    ),
                                    const Icon(Iconsax.calendar,
                                        color: Colors.white),
                                    if (controller
                                        .joinedYearController.text.isNotEmpty)
                                      SizedBox(
                                        height: height * .02,
                                      ),
                                    Text(controller.joinedYearController.text),
                                  ],
                                )),
                          )),
                          SizedBox(
                            width: height * .01,
                          ),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      DialogWidget());
                            },
                            child: Obx(
                              () => Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white12,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: height,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Department",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width * 0.05,
                                            color: Colors.white),
                                      ),
                                      const Icon(Iconsax.courthouse,
                                          color: Colors.white),
                                      if (controller.selectedDepartment.value !=
                                          "")
                                        SizedBox(
                                          height: height * .02,
                                        ),
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.02),
                                          child: Text(
                                            controller.selectedDepartment.value,
                                            style: const TextStyle(
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          )),
                                    ],
                                  )),
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Expanded(
                      flex: 4,
                      child: GestureDetector(
                        onTap: ()=>controller.filterAlumni(),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: height,
                          child: Text(
                            "Filter",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: width * 0.05,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

//dialogue for year

class DialogueWidget1 extends StatelessWidget {
  DialogueWidget1({super.key});

  final AlumniDirController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      child: Container(
        height: height * 0.25,
        width: width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Constants.cardColor().withOpacity(0.7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Enter Joined Year',
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
            ),
            Container(
              width: width * .7,
              height: height * .051,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Constants.cardColor().withOpacity(0.9)),
              child: TextFormField(
                controller: controller.joinedYearController,
                decoration: const InputDecoration(
                  hintText: "YYYY",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 5),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: width * 0.3,
                height: height * .053,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(0.5)),
                child: const Text(
                  "OK",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//dialog for department
class DialogWidget extends StatelessWidget {
  DialogWidget({super.key});
  final RegistrationController registrationController = Get.find();
  final AlumniDirController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      child: Container(
        height: height * 0.25,
        width: width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Constants.cardColor().withOpacity(0.7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Enter Department',
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
            ),
            Container(
                width: width * .7,
                height: height * .051,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Constants.cardColor().withOpacity(0.5)),
                child: Obx(
                  () => (registrationController.isdepartmentfetched.value ==
                          false)
                      ? const Center(child: CupertinoActivityIndicator())
                      : DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(20),
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
                                controller.selectedDepartment.value =
                                    value.toString();
                                registrationController.selectedDepartment
                                    .value = value.toString();
                                controller.deptIndex.value =
                                    registrationController.depNames
                                            .indexOf(value.toString()) +
                                        1;
                              },
                            ),
                          ),
                        ),
                )),
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: width * 0.3,
                height: height * .053,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(0.5)),
                child: const Text(
                  "OK",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
