import 'package:alma/profile/controllers/profile_controller.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 61, 77, 90),
            ),
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                      width: width * 0.25,
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                          foregroundImage: NetworkImage(
                            "${profileController.user.value.imageUrl}",
                          ))),
                ),
                Text(
                  "${profileController.user.value.username}",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text(''),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text(
              'Events',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            onTap: () {
              Get.toNamed('/calender-page');
            },
          ),
          ListTile(
            title: const Text(
              'Jobs',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            onTap: () {
              eventsController.fetchJob();
              Get.toNamed('/job-page');
            },
          ),
          ListTile(
            title: const Text(
              'Internships',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            onTap: () {
              eventsController.fetchInternship();
              Get.toNamed('/internship-page');
            },
          ),
          ListTile(
            title: const Text(
              'Collage Events',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            onTap: () {
              eventsController.fetchCollageEvent();
              Get.toNamed('/collageEvent-page');
            },
          ),
          ListTile(
            title: const Text(
              'Other Events',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            onTap: () {
              eventsController.fetchOtherEvent();
              Get.toNamed('/otherEvent-page');
            },
          ),
        ],
      ),
    );
  }
}
