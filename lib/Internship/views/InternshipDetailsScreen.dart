import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../events/controllers/event_controller.dart';

class InternshipDetailsScreen extends StatelessWidget {
  const InternshipDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EventsController controller = Get.find();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Internship Details'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 0.01 * height,
          ),
          Center(
            child: Image.asset(
              'assets/images/tcs.png',
              scale: 1.1,
            ),
          ),
          Text(
             "${controller.internship[0].eventName}",
            style: TextStyle(
                fontFamily: 'Helvatica',
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
          Text(
            " ${controller.internship[1].eventDate}",
            style: TextStyle(
              fontFamily: 'Helvatica',
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 0.03 * height,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
             
            ],
          ),
          SizedBox(
            height: 0.03 * height,
          ),
          Container(
            height: 0.3 * height,
            width: 0.95 * width,
            decoration: BoxDecoration(
                color: Color(0xff292A36),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.only(left: 0.03 * width, top: 0.01 * height),
              child: Text(
                "Requirements :\n${controller.internship[1].skillsRequired}",
                style: const TextStyle(
                    fontSize: 17,
                    fontFamily: 'Helvatica',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 0.03 * height,
          ),
          Container(
            height: 0.25 * height,
            width: 0.95 * width,
            decoration: BoxDecoration(
                color: Color(0xff292A36),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.only(left: 0.03 * width, top: 0.01 * height),
              child: Text(
                "Description: \n${controller.internship[1].description}",
                style: const TextStyle(
                    fontSize: 17,
                    fontFamily: 'Helvatica',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 0.025 * height,
          ),
          Container(
            width: 0.3 * width,
            height: 0.06 * height,
            decoration: BoxDecoration(
                color: Color(0xff292A36),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                'Apply',
                style: TextStyle(
                  fontFamily: 'Helvatica',
                  fontSize: 17,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.025 * height,
          )
        ],
      ),
    );
  }
}
