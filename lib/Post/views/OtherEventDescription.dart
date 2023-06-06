import 'package:alma/Post/controllers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants.dart';

class OtherEventDescriptionScreen extends StatelessWidget {
  OtherEventDescriptionScreen({super.key});

  final PostController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
              controller.clearControllers();
            },
            icon: const Icon(Iconsax.arrow_left_2)),
        title: const Text("Other Event Description"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(19, 30, 4, 6),
                          child: Text(
                            'Event name',
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
                              controller: controller.eventName,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 5),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(19, 15, 4, 6),
                          child: Text(
                            'Event Date',
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
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color:
                                        Constants.cardColor().withOpacity(0.7),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(controller.eventDate.value),
                                      IconButton(
                                          onPressed: () => controller.pickDate(
                                              context, height),
                                          icon: const Icon(Iconsax.calendar))
                                    ],
                                  )),
                            ),
                          ),
                        
                        const Padding(
                          padding: EdgeInsets.fromLTRB(19, 15, 4, 6),
                          child: Text(
                            'Venue',
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
                              controller: controller.venue,
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
              const Spacer(),
              GestureDetector(
                onTap: () => controller.addCollegeAndOtherEvent(),
                child: Container(
                  alignment: Alignment.center,
                  width: width * 0.35,
                  height: height * .053,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Constants.cardColor().withOpacity(0.7)),
                  child: Obx(
                    () => FittedBox(
                      child: Text(
                        controller.postingText.value,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
