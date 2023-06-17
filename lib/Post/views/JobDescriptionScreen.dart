import 'dart:developer';

import 'package:alma/Post/controllers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants.dart';

class JobDescriptionScreen extends StatelessWidget {
  JobDescriptionScreen({super.key});

  final PostController postController = Get.find();

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
              postController.clearControllers();
            },
            icon: const Icon(Iconsax.arrow_left_2)),
        title: const Text("Job Description"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(19, 15, 4, 10),
                      child: Text(
                        'Job Name',
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
                          controller: postController.eventName,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 5),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
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
                          controller: postController.companyName,
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
                        'Role',
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
                          controller: postController.role,
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
                        'Last Date to Apply',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Center(
                      child: Obx(
                        () => Container(
                            padding: EdgeInsets.only(left: width * 0.02),
                            alignment: Alignment.center,
                            width: width * 0.8,
                            height: height * .053,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Constants.cardColor().withOpacity(0.7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(postController.lastDayToApply.value),
                                IconButton(
                                    onPressed: () async {
                                      await postController.pickDate(
                                          context, height);

                                      postController.lastDayToApply.value =
                                          postController.selectedDate.value;
                                      log(postController.lastDayToApply.value);
                                    },
                                    icon: const Icon(Iconsax.calendar))
                              ],
                            )),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(19, 15, 4, 10),
                      child: Text(
                        'Skills Required',
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
                                const BorderRadius.all(Radius.circular(10)),
                            color: Constants.cardColor().withOpacity(0.7)),
                        child: TextFormField(
                          controller: postController.skillsRequired,
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
                        'Event Link',
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
                            //color: Color(0xff25262E),
                            color: Constants.cardColor().withOpacity(0.7)),
                        child: TextFormField(
                          controller: postController.eventLink,
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
            SizedBox(
              height: width * 0.05,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => postController.addJobEvent(),
              child: Container(
                alignment: Alignment.center,
                width: width * 0.35,
                height: height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Constants.cardColor().withOpacity(0.7)),
                child: Obx(
                  () => FittedBox(
                    child: Text(
                      postController.postingText.value,
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
              height: height * 0.02,
            )
          ],
        ),
      ),
    );
  }
}
