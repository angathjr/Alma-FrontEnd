import 'package:alma/events/controllers/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'OtherEventDetailsScreen.dart';

class OtherEventScreen extends StatelessWidget {
  OtherEventScreen({super.key});

  final EventsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: const Text(
            'Other Events',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black),
      body: Obx(
        () => controller.isOtherEventLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: controller.otherEvent.length,
                itemBuilder: ((context, index) {
                  return Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OtherEventsDetailsScreen()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 0.25 * height,
                          width: 0.87 * width,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff1A1B27),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 0.015 * height,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: .030 * width,
                                  ),
                                  Container(
                                    width: 0.31 * width,
                                    height: 0.185 * height,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Color(0xffC0CEEF),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/tcs.png'))),
                                  ),
                                  SizedBox(
                                    width: .030 * width,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${controller.otherEvent[index].eventName}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                        ),
                                      ),
                                      SizedBox(
                                        height: .005 * height,
                                      ),
                                      Text(
                                        "${controller.otherEvent[index].companyName}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 0.025 * height,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: .030 * width,
                                  ),
                                  Text(
                                    "${controller.otherEvent[index].eventDate}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              )
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