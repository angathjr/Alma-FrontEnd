import 'package:alma/events/controllers/event_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants.dart';

class JobScreen extends StatelessWidget {
  JobScreen({super.key});

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
          'Jobs',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(
        () => controller.isJobLoading.value
            ? const Center(
                child: CupertinoActivityIndicator(),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: controller.jobs.length,
                itemBuilder: ((context, index) {
                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        controller.gotoEvent(controller.jobs[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width,
                          height: height * .22,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            color: Constants.cardColor().withOpacity(0.65),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 0.015 * height,
                              ),
                              Row(
                                children: [
                                  if (controller.jobs[index].imgUrl != "")
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: height * 0.15,
                                          width: width * .01,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: CachedNetworkImage(
                                                
                                                imageUrl: "${controller.jobs[index].imgUrl}}",
                                                fit: BoxFit.cover,
                                              )
                                              ),
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
                                          padding:
                                              const EdgeInsets.symmetric(),
                                          child: Text(
                                            "${controller.jobs[index].eventName}",
                                            style: const TextStyle(
                                                fontSize: 22,
                                                fontFamily: 'Helavtica',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${controller.jobs[index].eventDescription}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Helavtica',
                                          ),
                                        ),
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
