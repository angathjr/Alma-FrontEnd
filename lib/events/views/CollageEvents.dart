import 'package:alma/events/controllers/event_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import 'CollageEventDetails.dart';

class CollageEventScreen extends StatelessWidget {
  CollageEventScreen({super.key});

  final EventsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Collage Events',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(
        () => controller.isCollageEventLoading.value
            ?  const Center(
                child: CupertinoActivityIndicator(),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: controller.collageEvent.length,
                itemBuilder: ((context, index) {
                  return Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CollageEventsDetailsScreen()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: width,
                            height: height * .22,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Constants.cardColor().withOpacity(0.7)),
                            child: Row(
                              children: [
                                if (controller.collageEvent[index].imgUrl != "")
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: height * 0.15,
                                        width: width * .01,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.network(
                                              "${controller.collageEvent[index].imgUrl}}",
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                  ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    child: Column(children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 30, 10, 10),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(),
                                          child: Text(
                                            "${controller.collageEvent[index].eventName}",
                                            style: const TextStyle(
                                                fontSize: 25,
                                                fontFamily: 'Helavtica',
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
                                            fontFamily: 'Helavtica',
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
