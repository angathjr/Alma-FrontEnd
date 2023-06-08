import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
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
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Iconsax.arrow_left_2)),
        title: Text(
          "${controller.selectedEvent.value.eventName}",
          style: TextStyle(fontSize: width * 0.05),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              SizedBox(
                height: height * 0.03,
              ),
              if (controller.selectedEvent.value.imgUrl != "")
                Column(
                  children: [
                    Container(
                      // height: height * 0.58,
                      width: width,
                      decoration: BoxDecoration(
                        // color: Colors.amber,
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
                            imageUrl:
                                "${controller.selectedEvent.value.imgUrl}",
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      constraints: BoxConstraints(
                          maxHeight:
                              (controller.selectedEvent.value.imgUrl != "")
                                  ? height * 0.12
                                  : height * .5),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Text(
                            "${controller.selectedEvent.value.eventName}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: const TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              Row(
                children: const [
                  Text(
                    "Description:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 12, 0),
                child: Container(
                  width: width,
                  child: Text(
                    "${controller.selectedEvent.value.eventDescription}",
                    softWrap: true,

                    style: Constants.txtStyle().copyWith(fontSize: 16),
                    // overflow: TextOverflow.ellipsis
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
