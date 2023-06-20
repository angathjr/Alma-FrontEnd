import 'package:alma/core/constants.dart';
import 'package:alma/profile/controllers/profile_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../alumniDirectory/controllers/alumni_dir_controller.dart';
import '../../events/controllers/event_controller.dart';

class NavigationDrawerScreen extends StatelessWidget {
  NavigationDrawerScreen({super.key});
  final EventsController eventsController = Get.find();
  final ProfileController profileController = Get.find();
  final AlumniDirController alumniDirController = Get.find();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AnimationConfiguration.synchronized(
      child: FadeInAnimation(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(milliseconds: 1500),
        child: Drawer(
          width: width * 0.6,
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
                child: SlideAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 1500),
                  verticalOffset: 50.0,
                  child: Column(
                    children: [
                      Expanded(
                        child: SizedBox(
                            width: width * 0.25,
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.transparent,
                                foregroundImage:
                                    profileController.user.value.imageUrl != ""
                                        ? CachedNetworkImageProvider(
                                            "${profileController.user.value.imageUrl}",
                                          )
                                        : const AssetImage(NOIMAGE)
                                            as ImageProvider)),
                      ),
                      Text(
                        "${profileController.user.value.firstName}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              SlideAnimation(
                horizontalOffset: -30,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 1500),
                child: ListTile(
                  leading: const Icon(Iconsax.briefcase, color: Colors.white),
                  title: const Text(
                    'Jobs',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    eventsController.fetchJob();
                    Get.toNamed('/job-page');
                  },
                ),
              ),
              SlideAnimation(
                verticalOffset: -30,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 1500),
                child: ListTile(
                  leading: const Icon(FeatherIcons.award, color: Colors.white),
                  title: const Text(
                    'Internships',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    eventsController.fetchInternship();
                    Get.toNamed('/internship-page');
                  },
                ),
              ),
              SlideAnimation(
                verticalOffset: -30,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 1500),
                child: ListTile(
                  leading: const Icon(Iconsax.building, color: Colors.white),
                  title: const Text(
                    'College Events',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    eventsController.fetchCollageEvent();
                    Get.toNamed('/collageEvent-page');
                  },
                ),
              ),
              SlideAnimation(
                verticalOffset: -30,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 1500),
                child: ListTile(
                  leading: const Icon(Iconsax.calendar, color: Colors.white),
                  title: const Text(
                    'Other Events',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    eventsController.fetchOtherEvent();
                    Get.toNamed('/otherEvent-page');
                  },
                ),
              ),
              SlideAnimation(
                verticalOffset: -30,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 1500),
                child: ListTile(
                  leading: const Icon(
                    FeatherIcons.users,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Alumni Directory',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    alumniDirController.fetchAlumni();
                    alumniDirController.clearControllers();
                    Get.toNamed('/alumni-dir');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
