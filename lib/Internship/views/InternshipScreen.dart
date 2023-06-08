import 'package:alma/events/controllers/event_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants.dart';

class InternshipScreen extends StatelessWidget {
  InternshipScreen({super.key});

  final EventsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Iconsax.arrow_left_2)),
          title: const Text(
            'Internship',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black),
      body: Obx(
        () => controller.isInternshipLoading.value
            ? const Center(
                child: CupertinoActivityIndicator(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.internship.length,
                    itemBuilder: ((context, index) {
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            controller.gotoEvent(controller.internship[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              width: width,
                              height: height * .22,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Constants.cardColor().withOpacity(0.65),
                              ),
                              child: Row(
                                children: [
                                  if (controller.internship[index].imgUrl != "")
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: height * 0.15,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: CachedNetworkImage(
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        Center(
                                                  child: CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation(
                                                              context.theme
                                                                  .disabledColor),
                                                      value: downloadProgress
                                                          .progress),
                                                ),
                                                imageUrl:
                                                    "${controller.internship[index].imgUrl}}",
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                      ),
                                    ),
                                  Expanded(
                                    flex: 5,
                                    child: Column(children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 30, 10, 10),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(),
                                          child: Text(
                                            "${controller.internship[index].eventName}",
                                            style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${controller.internship[index].eventDescription}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
              ),
      ),
    );
  }
}
