import 'dart:io';

import 'package:alma/profile/controllers/profile_edit_controller.dart';
import 'package:alma/profile/views/general_profile_edit_screen.dart';
import 'package:alma/profile/views/staff_edit_profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../controllers/tab_controller.dart';
import 'alumni_edit_profile_screen.dart';

class ProfileEditScreen extends StatelessWidget {
  ProfileEditScreen({super.key});

  final ProfileEditController controller = Get.find();
  final ProfileTabController tabController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
              controller.selectedImage.value = File('');
            },
            icon: const  Icon(Iconsax.arrow_left_2)),
        backgroundColor: Colors.black,
        title: const Text('Edit Profile'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: width,
                child: SizedBox(
                  height: height * .17,
                  width: width * 0.3,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Obx(
                        () => CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              "${controller.user.value.imageUrl}"),
                          foregroundImage:
                              controller.isImageSelected.value == true
                                  ? FileImage(controller.selectedImage.value)
                                      as ImageProvider<Object>
                                  : CachedNetworkImageProvider(
                                      "${controller.user.value.imageUrl}"),
                        ),
                      ),
                      Positioned(
                        bottom: height * 0.01,
                        right: width * 0.02,
                        child: Container(
                          alignment: Alignment.center,
                          width: width * 0.09,
                          height: width * 0.09,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                              onPressed: () => controller.selectImage(),
                              icon: Icon(
                                Icons.camera_alt,
                                size: width * 0.05,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
                child: TabBar(
                  dividerColor: Colors.transparent,
                  physics: const BouncingScrollPhysics(),
                  isScrollable: false,
                  controller: tabController.tabController,
                  tabs: tabController.tabs,
                  indicatorColor: Colors.grey,
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.label,
                  // padding: EdgeInsets.only(right: width * 0.19),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              SizedBox(
                height: height * 0.78,
                child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController.tabController,
                    children: [
                      GeneralProfileEditScreen(),
                      (controller.user.value.userType == "ALUMNI")
                          ? AlumniEditProfileScreen()
                          : ((controller.user.value.userType == "STAFF")
                              ? StaffProfileEdit()
                              : const Center(child: Text('NONE')))
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
