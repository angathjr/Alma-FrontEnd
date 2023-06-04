import 'package:alma/Post/controllers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants.dart';

class InternshipDescriptionScreen extends StatelessWidget {
  InternshipDescriptionScreen({super.key});

  final PostController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
              controller.clearControllers();
            },
            icon: const Icon(Iconsax.arrow_left_2)),
        title: const Text("Internship Description"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width * .89,
                height: height * .76,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(19, 30, 4, 10),
                          child: Text(
                            'Company name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: width * 0.8,
                            height: height * .053,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Constants.cardColor().withOpacity(0.7)),
                            child: TextFormField(
                              controller: controller.companyName,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 5),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(19, 15, 4, 10),
                          child: Text(
                            'Skill Required',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: width * 0.8,
                            height: height * .093,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Constants.cardColor().withOpacity(0.7)),
                            child: TextFormField(
                              controller: controller.skillsRequired,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 5),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(19, 15, 4, 10),
                          child: Text(
                            'Start date',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: width * 0.8,
                            height: height * .053,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Constants.cardColor().withOpacity(0.7)),
                            child: TextFormField(
                              controller: controller.startDate,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 5),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
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
                controller.addInternshipEvent();
              },
              child: Container(
                alignment: Alignment.center,
                width: width * 0.35,
                height: height * .053,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Constants.cardColor().withOpacity(0.7)),
                child: const Text(
                  "Post",
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
