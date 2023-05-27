import 'package:alma/Navbar/controllers/navcontroller.dart';
import 'package:alma/Post/views/postScreen.dart';
import 'package:alma/core/constants.dart';
import 'package:alma/feed/views/feedScreen.dart';
import 'package:alma/profile/views/profileScreen.dart';
import 'package:alma/search/views/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../eventCalendar/views/calendar_screen.dart';

class NavBarPage extends StatelessWidget {
  NavBarPage({Key? key}) : super(key: key);

  var pages = [
    FeedPage(),
    SearchPage(),
    postScreen(),
    CalendarScreen(),
    ProfilePage(),
  ];

  final navController = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double topHeight = height * 0.915;
    double navHeight = (height - topHeight) - (width * 0.035 * 2);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: width,
          height: height,
          decoration: Constants.buildBoxDecoration(),
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
                      color: const Color(0xff34353E).withOpacity(.40),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    // The nav bar icons are placed here

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildNavIcons(
                            navHeight: navHeight,
                            name: 'home',
                            w: 0.40,
                            h: 0.40,
                            index: 0),
                        buildNavIcons(
                            navHeight: navHeight,
                            name: 'search',
                            w: 0.35,
                            h: 0.35,
                            index: 1),
                        buildNavIcons(
                            navHeight: navHeight,
                            name: 'add',
                            w: 0.6,
                            h: 0.6,
                            index: 2),
                        buildNavIcons(
                            navHeight: navHeight,
                            name: 'calendar',
                            w: 0.35,
                            h: 0.35,
                            index: 3),
                        buildNavIcons(
                            navHeight: navHeight,
                            name: 'user',
                            w: 0.35,
                            h: 0.35,
                            index: 4),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  InkWell buildNavIcons(
      {required double navHeight,
      required String name,
      required double w,
      required double h,
      required int index}) {
    return InkWell(
      onTap: () {
        navController.changePage(index, navController.controller);
        navController.index.value = index;
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Obx(
            () => AnimatedContainer(
              curve: Curves.linear,
              duration: const Duration(milliseconds: 200),
              width: navHeight * 0.7,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (navController.index.value == index &&
                          navController.index.value != 2)
                      ? const Color(0xffD9D9D9).withOpacity(0.15)
                      : Colors.transparent),
            ),
          ),
          Container(
            width: navHeight * w,
            height: navHeight * h,
            decoration: const BoxDecoration(
                // color: Colors.blue,
                ),
            child: Image.asset(
              "assets/navbar/$name.png",
            ),
          ),
        ],
      ),
    );
  }
}
