import 'package:alma/profile/controllers/profile_edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';

class AlumniEditProfileScreen extends StatelessWidget {
  AlumniEditProfileScreen({super.key});
  final ProfileEditController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Constants.cardColor().withOpacity(0.7)),
              child: TextFormField(
                controller: controller.currentCompany,
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
              'Previous Companies',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Container(
              width: width * 02,
              height: height * .053,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Constants.cardColor().withOpacity(0.7)),
              child: TextFormField(
                controller: controller.previousCompany,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 5),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  controller.updateAlumni();
                },
                child: Obx(
                  () => Container(
                    alignment: Alignment.center,
                    width: width * 0.35,
                    height: height * .053,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Constants.cardColor().withOpacity(0.7)),
                    child: Text(
                      controller.submitText.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
            )
          ],
        ),
      ),
    );
  }
}
