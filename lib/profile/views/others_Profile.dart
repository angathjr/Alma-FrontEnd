import 'package:alma/auth/controllers/auth_controller.dart';
import 'package:alma/profile/views/alumni_edit_profile_screen.dart';
import 'package:alma/profile/views/staff_edit_profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/constants.dart';
import '../../events/controllers/event_controller.dart';
import '../controllers/profile_controller.dart';

class OthersProfile extends StatelessWidget {
  OthersProfile({Key? key}) : super(key: key);

  final AuthController authController = Get.find();
  final ProfileController profileController = Get.find();
  final EventsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double postSize = height * 0.6;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black),
      body: AnimationConfiguration.synchronized(
        child: FadeInAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(milliseconds: 2500),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.07 * width),
                    child: Text(
                      "${profileController.user.value.firstName!.capitalizeFirst}",
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 0.05 * width),
                    child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.transparent,
                        radius: width * 0.1,
                        foregroundImage: CachedNetworkImageProvider(
                          "${profileController.user.value.imageUrl}",
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 0.04 * height,
              ),
              SlideAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 2500),
                verticalOffset: -20,
                child: Container(
                  width: 0.9 * width,
                  height: 0.15 * height,
                  decoration: BoxDecoration(
                      color: Constants.cardColor().withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 0.04 * width, top: 0.01 * height),
                        child: const Text(
                          'Bio:',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.01 * height,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0.04 * width),
                        child: Text(
                          '${profileController.user.value.bio}',
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white60,
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 0.004 * height,
              ),
              SlideAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 2500),
                horizontalOffset: -20,
                child: Container(
                  height: 0.15 * height,
                  width: 0.9 * width,
                  decoration: BoxDecoration(
                      color: Constants.cardColor().withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 0.04 * width, top: 0.01 * height),
                        child: const Text(
                          'Interested Areas:',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.01 * height,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0.04 * width),
                        child: Text(
                          profileController.user.value.areaOfInterest!
                              .join(", "),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white60),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 0.004 * height,
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.04 * width),
                child: Text(
                  'Posts',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              Container(
                width: 0.9 * width,
                height: 0.4 * height,
                decoration: BoxDecoration(
                    color: Constants.cardColor().withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 0.03 * width,
                      right: 0.03 * width,
                      top: 0.02 * height),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(360),
                        child: SizedBox(
                          width: width * 0.11,
                          height: width * 0.11,
                          child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.transparent,
                              radius: width * 0.1,
                              foregroundImage: CachedNetworkImageProvider(
                                "${profileController.user.value.imageUrl}",
                              )),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${profileController.user.value.firstName!.capitalizeFirst}",
                            style: Constants.txtStyle().copyWith(fontSize: 17),
                          ),
                          Text(
                            "1 hour ago",
                            style: Constants.txtStyle().copyWith(fontSize: 11),
                          )
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                          width: width * 0.07,
                          height: width * 0.07,
                          child: const Icon(
                            FeatherIcons.moreHorizontal,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
