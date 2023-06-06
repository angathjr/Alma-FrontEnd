import 'package:alma/core/constants.dart';
import 'package:alma/profile/controllers/profile_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../events/controllers/event_controller.dart';

class NavigationDrawerScreen extends StatelessWidget {
  NavigationDrawerScreen({super.key});
  final EventsController eventsController = Get.find();
  final ProfileController profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Drawer(
      elevation: 0,
      backgroundColor: Constants.cardColor(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            curve: Curves.linear,
            decoration: BoxDecoration(
              color: Constants.cardColor(),
            ),
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                      width: width * 0.25,
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                          foregroundImage: CachedNetworkImageProvider(
                            "${profileController.user.value.imageUrl}",
                          ))),
                ),
                Text(
                  "${profileController.user.value.firstName}",
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.06,
          ),
          ListTile(
            title: const Text(
              'Jobs',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onTap: () {
              eventsController.fetchJob();
              Get.toNamed('/job-page');
            },
          ),
          ListTile(
            title: const Text(
              'Internships',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onTap: () {
              eventsController.fetchInternship();
              Get.toNamed('/internship-page');
            },
          ),
          ListTile(
            title: const Text(
              'Collage Events',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onTap: () {
              eventsController.fetchCollageEvent();
              Get.toNamed('/collageEvent-page');
            },
          ),
          ListTile(
            title: const Text(
              'Other Events',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onTap: () {
              eventsController.fetchOtherEvent();
              Get.toNamed('/otherEvent-page');
            },
            
          ),
            ListTile(
            title: const Text(
              'Alumni Directory',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onTap: () {
              eventsController.fetchOtherEvent();
              Get.toNamed('/alumniDirectory-page');
            },
            
          ),
        ],
      ),
    );
  }
}
