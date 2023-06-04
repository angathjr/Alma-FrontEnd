import 'package:alma/Navbar/controllers/navcontroller.dart';
import 'package:alma/Post/views/post_screen.dart';
import 'package:alma/events/controllers/event_controller.dart';
import 'package:alma/home/views/news_feed_screen.dart';
import 'package:alma/profile/views/profileScreen.dart';
import 'package:alma/search/views/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../eventCalendar/views/calendar_screen.dart';

class NavBarPage extends StatelessWidget {
  NavBarPage({Key? key}) : super(key: key);

  final navController = Get.put(NavController());
  final EventsController eventsController = Get.find();
  var pages = [
    NewsFeedScreen(),
    SearchPage(),
    PostScreen(),
    CalendarScreen(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double topHeight = height * 0.915;
    double navHeight = (height - topHeight) - (width * 0.035 * 2);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: width,
            height: height,
            // decoration: Constants.buildBoxDecoration(),
            color: Colors.black,
            child: Column(
              children: [
                //pageview

                SizedBox(
                  width: width,
                  height: topHeight,
                  child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: navController.controller,
                      children: pages),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(width * 0.03),
                    width: width,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff111111),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      // The nav bar icons are placed here

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildNavIcons(
                              navHeight: navHeight,
                              width: width,
                              index: 0,
                              icon: Icon(
                                Iconsax.home,
                                size: width * 0.055,
                              )),
                          buildNavIcons(
                              navHeight: navHeight,
                              width: width,
                              index: 1,
                              icon: Icon(
                                Iconsax.search_normal_1,
                                size: width * 0.055,
                              )),
                          buildNavIcons(
                              navHeight: navHeight,
                              width: width,
                              index: 2,
                              icon: Icon(
                                Iconsax.add_square,
                                size: width * 0.055,
                              )),
                          buildNavIcons(
                              navHeight: navHeight,
                              width: width,
                              index: 3,
                              icon: Icon(
                                Iconsax.calendar_search,
                                size: width * 0.055,
                              )),
                          buildNavIcons(
                              width: width,
                              navHeight: navHeight,
                              index: 4,
                              icon: Icon(
                                Iconsax.user,
                                size: width * 0.055,
                              )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget buildNavIcons(
      {required double navHeight,
      required int index,
      required Icon icon,
      required double width}) {
    return SizedBox(
        width: navHeight,
        height: navHeight,
        child: Obx(() => IconButton(
            color: Colors.grey.shade400,
            enableFeedback: true,
            splashRadius: 5,
            disabledColor: Colors.red,
            onPressed: () {
              navController.changePage(index, navController.controller);
              navController.index.value = index;
            },
            icon: Stack(
              children: [
                Center(child: icon),
                Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                    width:
                        (index == navController.index.value) ? width * 0.05 : 0,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ))));
  }
}
