import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants.dart';
import '../controllers/event_controller.dart';

class EventDetailsScreen extends StatelessWidget {
  EventDetailsScreen({super.key});

  EventsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('feed Details'),
      ),
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(children: [
            if (controller.selectedEvent.value.imgUrl != "")
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  // height: height * 0.58,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                  context.theme.disabledColor),
                              value: downloadProgress.progress),
                        ),
                        imageUrl: "${controller.selectedEvent.value.imgUrl}",
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            Container(
              constraints: BoxConstraints(
                  maxHeight: (controller.selectedEvent.value.imgUrl != "")
                      ? height * 0.25
                      : height * .5),
              child: Column(
                children: [
                  Text(
                    "${controller.selectedEvent.value.eventName}",
                    style: const TextStyle(
                        fontSize: 32,
                        fontFamily: 'Helavtica',
                        fontWeight: FontWeight.bold),
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 5, 1),
                        child: Text(
                          "Description:",
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Helavtica',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 12, 1),
                    child: Text(
                        "${controller.selectedEvent.value.eventDescription}",
                        maxLines: (controller.selectedEvent.value.imgUrl != "")
                            ? 5
                            : 20,
                        style: Constants.txtStyle().copyWith(fontSize: 14),
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
