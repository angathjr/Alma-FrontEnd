import 'package:alma/events/controllers/event_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants.dart';

class CollageEventScreen extends StatelessWidget {
  CollageEventScreen({super.key});

  final EventsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Iconsax.arrow_left_2)),
        title: const Text(
          'Collage Events',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(
        () => controller.isCollageEventLoading.value
            ? const Center(
                child: CupertinoActivityIndicator(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.collageEvent.length,
                    itemBuilder: ((context, index) {
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            controller
                                .gotoEvent(controller.collageEvent[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                                width: width,
                                height: height * .22,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color:
                                        Constants.cardColor().withOpacity(0.7)),
                                child: Row(
                                  children: [
                                    if (controller.collageEvent[index].imgUrl !=
                                        "")
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
                                                  imageUrl:
                                                      "${controller.collageEvent[index].imgUrl}}",
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
                                            padding:
                                                const EdgeInsets.symmetric(),
                                            child: Text(
                                              "${controller.collageEvent[index].eventName}",
                                              style: const TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${controller.collageEvent[index].eventDescription}",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ]),
                                    )
                                  ],
                                )),
                          ),
                        ),
                      );
                    })),
              ),
      ),
    );
  }
}
