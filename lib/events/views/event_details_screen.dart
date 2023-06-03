import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/event_controller.dart';

class EventDetailsScreen extends StatelessWidget {
   EventDetailsScreen({super.key});

 EventsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('feed Details'),
      ),
      body: Container(
        height: height,
        width: width,
     
        child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(color: Colors.amber),
              child: Image.network(
                 "${controller.events[0].imgUrl }",
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child:Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Event Name",
                style: TextStyle(
                fontFamily: 'Helvatica',
                fontSize: 30,
                fontWeight: FontWeight.bold),),
              )
            ),
          ),
         
        ]),
      ),
    );
  }
}
