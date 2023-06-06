import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/constants.dart';
import '../controllers/profile_controller.dart';

class AlumniEditProfileScreen extends StatelessWidget {
  AlumniEditProfileScreen({super.key});
  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
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
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Constants.cardColor().withOpacity(0.7)),
              child: TextFormField(
                //controller: controller.firstNameController,
                initialValue: controller.user.value.firstName,
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
            Text(
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
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Constants.cardColor().withOpacity(0.7)),
              child: TextFormField(
                //controller: controller.firstNameController,
                initialValue: controller.user.value.firstName,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 5),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
