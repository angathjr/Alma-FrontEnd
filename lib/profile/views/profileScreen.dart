import 'package:alma/events/controllers/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final EventsController eventsController = Get.find();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff050408),
      appBar: AppBar(
          title: Center(
            child: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.black),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset('assets/images/pic.png',
                height: height * .0825, width: width * 0.178),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 0.33 * width,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/phone.png',
                  height: 0.02 * height,
                  width: 0.06 * width,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '7498238661',
                  style: TextStyle(fontSize: 15, color: Color(0xff999999)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'prakash@gmail.com',
                style: TextStyle(
                  color: Color(0xff999999),
                  fontSize: 15,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => eventsController.fetchEvents(),
            child: Container(
              height: 0.56 * height,
              width: 0.888 * width,
              decoration: BoxDecoration(
                color: Color(0xff13141B),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/edit.png',
                    width: width * 0.133,
                    height: height * 0.061,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
