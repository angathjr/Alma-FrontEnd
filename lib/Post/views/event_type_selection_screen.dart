import 'package:alma/Post/controllers/post_controller.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants.dart';

class EventSelectionScreen extends StatelessWidget {
  EventSelectionScreen({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final PostController controller = Get.find();
  final double height;

  @override
  Widget build(BuildContext context) {
    double padd = width * 0.03;
    return Container(
      decoration: BoxDecoration(
        color: Constants.cardColor(),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: height * 0.55,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Your Post Belongs to ",
                style: TextStyle(fontSize: width * 0.06),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Obx(
              () => Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.08, vertical: width * 0.05),
                  width: width,
                  child: Column(
                    children: [
                      //first row

                      Expanded(
                        flex: 7,
                        child: Row(
                          children: [
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                controller.selectedEventType("J");
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:
                                          controller.selectedEventType.value !=
                                                  "J"
                                              ? Colors.grey.withOpacity(0.4)
                                              : Colors.grey),
                                  height: height,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Job",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width * 0.05,
                                            color: Colors.white),
                                      ),
                                      const Icon(Iconsax.briefcase,
                                          color: Colors.white)
                                    ],
                                  )),
                            )),
                            SizedBox(
                              width: padd,
                            ),
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                controller.selectedEventType("I");
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:
                                          controller.selectedEventType.value !=
                                                  "I"
                                              ? Colors.grey.withOpacity(0.4)
                                              : Colors.grey),
                                  height: height,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Internship",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width * 0.05,
                                            color: Colors.white),
                                      ),
                                      const Icon(FeatherIcons.award,
                                          color: Colors.white)
                                    ],
                                  )),
                            )),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: padd,
                      ),

                      //second row

                      Expanded(
                        flex: 7,
                        child: Row(
                          children: [
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                controller.selectedEventType("C");
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:
                                          controller.selectedEventType.value !=
                                                  "C"
                                              ? Colors.grey.withOpacity(0.4)
                                              : Colors.grey),
                                  height: height,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "College Events",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width * 0.05,
                                            color: Colors.white),
                                      ),
                                      const Icon(Iconsax.building,
                                          color: Colors.white)
                                    ],
                                  )),
                            )),
                            SizedBox(
                              width: padd,
                            ),
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                controller.selectedEventType("O");
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:
                                          controller.selectedEventType.value !=
                                                  "O"
                                              ? Colors.grey.withOpacity(0.4)
                                              : Colors.grey),
                                  height: height,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Other Events",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width * 0.05,
                                            color: Colors.white),
                                      ),
                                      const Icon(Iconsax.calendar,
                                          color: Colors.white)
                                    ],
                                  )),
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: padd,
                      ),
                      Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {
                              controller.goToEventDetailCompletion();
                            },
                            child: Container(
                              // width: width * 0.5,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.withOpacity(0.5)),
                              height: height,
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width * 0.05,
                                    color: Colors.white),
                              ),
                            ),
                          ))
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
