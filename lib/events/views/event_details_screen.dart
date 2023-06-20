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
          child: Column(children: [
            SizedBox(
              height: height * 0.03,
            ),

            //image
            if (controller.selectedEvent.value.imgUrl != "")
              Column(
                children: [
                  Container(
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
                  ),
                ],
              ),

            //event Name
            Column(
              children: [
                Text(
                  "${controller.selectedEvent.value.eventName}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: const TextStyle(
                      fontSize: 27, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: height * .01,
            ),

            //Description

            if (controller.selectedEvent.value.eventDescription != "")
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Description ",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * .005, horizontal: width * .03),
                      child: Container(
                        width: width,
                        child: Text(
                          "${controller.selectedEvent.value.eventDescription}",
                          softWrap: true,

                          style: Constants.txtStyle().copyWith(fontSize: 16),
                          // overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: height * .01,
            ),

//company name

            if (controller.selectedEvent.value.companyName != "")
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Company Name ",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * .005, horizontal: width * .03),
                      child: SizedBox(
                        width: width,
                        child: Text(
                          "${controller.selectedEvent.value.companyName}",
                          softWrap: true,

                          style: Constants.txtStyle().copyWith(fontSize: 16),
                          // overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: height * .01,
            ),

//Role

            if (controller.selectedEvent.value.role != "")
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Role ",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * .005, horizontal: width * .03),
                      child: Container(
                        width: width,
                        child: Text(
                          "${controller.selectedEvent.value.role}",
                          softWrap: true,

                          style: Constants.txtStyle().copyWith(fontSize: 16),
                          // overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: height * .01,
            ),

//skill Required

            if (controller.selectedEvent.value.skillsRequired!.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Skill Required ",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * .005, horizontal: width * .03),
                      child: SizedBox(
                        width: width,
                        child: Text(
                          "${controller.selectedEvent.value.skillsRequired!.join(", ")}",
                          softWrap: true,

                          style: Constants.txtStyle().copyWith(fontSize: 16),
                          // overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: height * .01,
            ),

//last date to apply

            if (controller.selectedEvent.value.lastDateToApply != "")
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Last Date to Apply ",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * .005, horizontal: width * .03),
                      child: SizedBox(
                        width: width,
                        child: Text(
                          "${controller.selectedEvent.value.lastDateToApply}",
                          softWrap: true,

                          style: Constants.txtStyle().copyWith(fontSize: 16),
                          // overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: height * .01,
            ),

//Duration

            if (controller.selectedEvent.value.duration != "")
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Duartion ",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * .005, horizontal: width * .03),
                      child: Container(
                        width: width,
                        child: Text(
                          "${controller.selectedEvent.value.duration}",
                          softWrap: true,

                          style: Constants.txtStyle().copyWith(fontSize: 16),
                          // overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: height * .01,
            ),

//venue

            if (controller.selectedEvent.value.venue != "")
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "venue ",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * .005, horizontal: width * .03),
                      child: SizedBox(
                        width: width,
                        child: Text(
                          "${controller.selectedEvent.value.venue}",
                          softWrap: true,

                          style: Constants.txtStyle().copyWith(fontSize: 16),
                          // overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: height * .01,
            ),

//event Link

            if (controller.selectedEvent.value.eventLink != "")
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Event Link",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * .005, horizontal: width * .03),
                      child: Container(
                        width: width,
                        child: Text(
                          "${controller.selectedEvent.value.eventLink}",
                          softWrap: true,

                          style: Constants.txtStyle().copyWith(fontSize: 16),
                          // overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: height * .01,
            ),
          ]),
        ),
      ),

      //apply now button

      bottomNavigationBar: (controller.selectedEvent.value.eventLink != "")
          ? Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width * .05, vertical: 10),
              child: GestureDetector(
                onTap: () => controller
                    .launchurl(controller.selectedEvent.value.eventLink!),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(15)),
                  width: width,
                  height: height * 0.06,
                  child: Text(
                    "Apply Now",
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
