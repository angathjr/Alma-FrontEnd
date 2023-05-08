import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../core/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
          Row(
            children: [
              SizedBox(
                width: 0.03 * width,
              ),
              Text(
                'Hi',
                style: TextStyle(fontSize: 25, fontFamily: 'Helvatica'),
              ),
              SizedBox(
                width: 0.015 * width,
              ),
              Text(
                'Kishan',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Helavtica',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 0.44 * width,
              ),
              Image.asset(
                'assets/images/pic.png',
                width: 0.25 * width,
                height: 0.067 * height,
              )
            ],
          ),
          SizedBox(
            height: 0.08 * height,
          ),
          Container(
            height: 0.2 * height,
            width: 0.9 * width,
            decoration: BoxDecoration(
                color: Color(0xff292A36),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.only(left: 0.02 * width, top: 0.01 * height),
              child: Text(
                'Bio',
                style: TextStyle(
                    fontFamily: 'Helvatica',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 0.02 * height,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 0.3 * height,
                width: 0.405 * width,
                decoration: BoxDecoration(
                    color: Color(0xff292A36),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit),
                    Text(
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
              Column(
                children: [
                  Container(
                    height: 0.14 * height,
                    width: 0.405 * width,
                    decoration: BoxDecoration(
                        color: Color(0xff292A36),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.post_add),
                        Text(
                          'New Posts',
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
                    height: 0.02 * height,
                  ),
                  Container(
                    height: 0.14 * height,
                    width: 0.405 * width,
                    decoration: BoxDecoration(
                        color: Color(0xff292A36),
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
                  )
                ],
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
