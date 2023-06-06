import 'package:alma/eventCalendar/controllers/calendar_controller.dart';
import 'package:alma/events/controllers/event_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/constants.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({super.key});

  final EventCalendarController controller = Get.find();
  final EventsController eventsController = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Events Calendar',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            SizedBox(
              child: Obx(
                () => TableCalendar(
                  rowHeight: height * 0.055,
                  focusedDay: controller.selectedDay.value,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: true,
                    weekendTextStyle: const TextStyle(color: Colors.white),
                    defaultTextStyle: const TextStyle(color: Colors.white),
                    todayDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(color: Colors.white),
                      //borderRadius: BorderRadius.circular(50.0),
                    ),
                    selectedDecoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                      //borderRadius: BorderRadius.circular(50.0)
                    ),
                  ),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 30,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 30,
                    ),
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) =>
                      isSameDay(day, controller.selectedDay.value),
                  onDaySelected: controller.onDaySelected,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              width: width,
              height: height * 0.03,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Scheduled Events',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => Expanded(
                child: controller.isEventsFetched.value == false
                    ? const Center(
                        child: CupertinoActivityIndicator(),
                      )
                    : controller.events.isEmpty
                        ? const Center(
                            child: Text(
                              'No events scheduled',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.events.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01),
                                child: GestureDetector(
                                  onTap: () => eventsController
                                      .gotoEvent(controller.events[index]),
                                  child: SizedBox(
                                    width: 0.9 * width,
                                    height: 0.129 * height,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              50, 0, 0, 0),
                                          child: Container(
                                            width: 0.8 * width,
                                            height: 0.127 * height,
                                            decoration: BoxDecoration(
                                              color: Constants.cardColor()
                                                  .withOpacity(0.7),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${controller.events[index].eventName}",
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  "${controller.events[index].eventDescription}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            left: 5,
                                            top: 25,
                                            child: Container(
                                              height: 0.065 * height,
                                              width: 0.206 * width,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 36, 36, 49),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${controller.events[index].eventDate!.day}",
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${controller.events[index].eventDate!.month}",
                                                      style: const TextStyle(
                                                          fontSize: 18),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
              ),
            )
          ],
        ));
  }
}
