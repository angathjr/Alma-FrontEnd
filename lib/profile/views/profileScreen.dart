import 'package:alma/auth/controllers/auth_controller.dart';
import 'package:alma/events/controllers/event_controller.dart';
import 'package:alma/registration/controllers/staff_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 0.04 * width),
                child: Text(
                  "Hi, ${profileController.user.value.firstName}",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Helavtica',
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(
                  width: width * 0.25,
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.transparent,
                      radius: 32,
                      foregroundImage: NetworkImage(
                        "${profileController.user.value.imageUrl}",
                      ))),
            ],
          ),
          SizedBox(
            height: 0.05 * height,
          ),
          Container(
            height: 0.2 * height,
            width: 0.9 * width,
            decoration: BoxDecoration(
               color: Constants.cardColor().withOpacity(0.7),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.only(left: 0.02 * width, top: 0.01 * height),
              child: const Text(
                'Bio:',
                style: TextStyle(
                  fontFamily: 'Helvatica',
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.004 * height,
          ),
          Container(
            height: 0.15 * height,
            width: 0.9 * width,
            decoration: BoxDecoration(
                color: Constants.cardColor().withOpacity(0.7),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.only(left: 0.02 * width, top: 0.01 * height),
              child: const Text(
                'Interested Areas:',
                style: TextStyle(
                  fontFamily: 'Helvatica',
                  fontSize: 20,
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
              InkWell(
                onTap: () {
                  Get.toNamed('/EditProfile');
                },
                child: Container(
                  height: 0.3 * height,
                  width: 0.445 * width,
                  decoration: BoxDecoration(
                     color: Constants.cardColor().withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit),
                      const Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Helvatica',
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 0.01 * width,
              ),
              Container(
                height: 0.3 * height,
                width: 0.445 * width,
                child: Column(
                  children: [
                    Container(
                      height: 0.148 * height,
                      width: 0.445 * width,
                      decoration: BoxDecoration(
                         color: Constants.cardColor().withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.post_add),
                          Text(
                            'My Posts',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Helvatica',
                              //fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.004 * height,
                    ),
                    GestureDetector(
                      onTap: () => authController.signout(),
                      child: Container(
                        height: 0.148 * height,
                        width: 0.445 * width,
                        decoration: BoxDecoration(
                           color: Constants.cardColor().withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.logout),
                            Text(
                              'Log Out',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Helvatica',
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 0.05 * width,
              )
            ],
          ),
          // SizedBox(
          //   height: 0.02 * height,
          // ),
          // Container(
          //   height: 0.18 * height,
          //   width: 0.9 * width,
          //   decoration: BoxDecoration(
          //       color: Color(0xff292A36),
          //       borderRadius: BorderRadius.circular(10)),
          // )
        ],
      ),
    );
  }
}
