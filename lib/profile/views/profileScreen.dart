import 'package:alma/auth/controllers/auth_controller.dart';
import 'package:alma/profile/views/others_Profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/constants.dart';
import '../controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final AuthController authController = Get.find();
  final ProfileController profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          title: const Center(
            child: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
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
                      "Hi, ${profileController.user.value.firstName!.capitalizeFirst}",
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 0.05 * width),
                    child: CircleAvatar(
                        backgroundColor: Colors.white54,
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
              Expanded(
                flex: 1,
                child: SlideAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 2500),
                  verticalOffset: -20,
                  child: Container(
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
              ),
              SizedBox(
                height: 0.004 * height,
              ),
              Expanded(
                flex: 1,
                child: SlideAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 2500),
                  horizontalOffset: -20,
                  child: Container(
                    //height: 0.15 * height,
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
              ),
              SizedBox(
                height: 0.004 * height,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 0.05 * width,
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        //Get.toNamed('/EditProfile');

                        Get.to(() => OthersProfile());
                        // Get.toNamed('/AlumniEditProfile');
                      },
                      child: SlideAnimation(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: const Duration(milliseconds: 2500),
                        horizontalOffset: -20,
                        child: Container(
                          height: 0.3 * height,
                          width: 0.445 * width,
                          decoration: BoxDecoration(
                              color: Constants.cardColor().withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                FeatherIcons.edit3,
                                color: Colors.white70,
                              ),
                              Text(
                                'Edit Profile',
                                style: TextStyle(
                                    fontSize: width * 0.045,
                                    color: Colors.white60

                                    //fontWeight: FontWeight.bold
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.01 * width,
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 0.3 * height,
                      width: 0.445 * width,
                      child: SlideAnimation(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: const Duration(milliseconds: 2500),
                        horizontalOffset: 20,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => profileController.fetchMyEvents(),
                              child: Container(
                                height: 0.148 * height,
                                width: 0.445 * width,
                                decoration: BoxDecoration(
                                    color:
                                        Constants.cardColor().withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Iconsax.note,
                                      color: Colors.white70,
                                    ),
                                    Text(
                                      'My Posts',
                                      style: TextStyle(
                                          fontSize: width * 0.045,
                                          color: Colors.white60

                                          //fontWeight: FontWeight.bold
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 0.004 * height,
                            ),
                            GestureDetector(
                              onTap: () => authController.logOut(),
                              child: SlideAnimation(
                                curve: Curves.fastLinearToSlowEaseIn,
                                duration: const Duration(milliseconds: 2500),
                                verticalOffset: 20,
                                child: Container(
                                  height: 0.148 * height,
                                  width: 0.445 * width,
                                  decoration: BoxDecoration(
                                      color: Constants.cardColor()
                                          .withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Iconsax.logout,
                                        color: Colors.white70,
                                      ),
                                      Text(
                                        'Log Out',
                                        style: TextStyle(
                                            fontSize: width * 0.045,
                                            color: Colors.white60
                                            //fontWeight: FontWeight.bold
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.05 * width,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
