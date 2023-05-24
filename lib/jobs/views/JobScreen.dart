import 'dart:developer';
import 'dart:html';

import 'package:alma/events/controllers/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'jobsDetailsScreen.dart';



class JobScreen extends StatelessWidget {
  JobScreen({super.key});

 
  @override
  Widget build(BuildContext context) {
    final EventsController controller = Get.find();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: const Text(
            'Jobs',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.jobs.length,
          itemBuilder: ((context, index) {
            return 
            Center(
              child: InkWell(
                onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => JobsDetailsScreen(controller: index)
                                 ),
                               );
                             },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                     height: 0.25 * height,
                     width: 0.87 * width,
                     decoration: const BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                       color: Color(0xff1A1B27),
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         SizedBox(
                           height: 0.015 * height,
                         ),
                         Row(
                           children: [
                             SizedBox(
                               width: .030 * width,
                             ),
                             Container(
                               width: 0.31 * width,
                               height: 0.185 * height,
                               decoration: const BoxDecoration(
                                   borderRadius: BorderRadius.all(Radius.circular(10)),
                                   color: Color(0xffC0CEEF),
                                   image: DecorationImage(
                                       image: AssetImage('assets/images/tcs.png'))),
                             ),
                             SizedBox(
                               width: .030 * width,
                             ),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                  
                                   "${controller.jobs[index].eventName}",
                                   style: const TextStyle(
                                     color: Colors.white,
                                     fontSize: 21,
                                   ),
                                 ),
                                 SizedBox(
                                   height: .005 * height,
                                 ),
                                  Text(
                                   "${controller.jobs[index].companyName}",
                                   style: const TextStyle(
                                     color: Colors.white,
                                     fontSize: 15,
                                   ),
                                 ),
                               ],
                             )
                           ],
                         ),
                         SizedBox(
                           height: 0.025 * height,
                         ),
                         Row(
                           children: [
                             SizedBox(
                               width: .030 * width,
                             ),
                              Text(
                               "${controller.jobs[1].eventDate}",
                               style: const TextStyle(
                                 color: Colors.white,
                                 fontSize: 13,
                               ),
                             ),
                           ],
                         )
                       ],
                     ),
                  ),
                ),
              ),
            );
          })),

      //  Padding(
      //    padding: const EdgeInsets.fromLTRB(8.0,10,10,520),
      //    child: Center(
      //      child: Container(
      //         height: 0.25 * height,
      //         width: 0.87 * width,
      //         decoration: const BoxDecoration(
      //           borderRadius: BorderRadius.all(Radius.circular(10)),
      //           color: Color(0xff1A1B27),
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             SizedBox(
      //               height: 0.015 * height,
      //             ),
      //             Row(
      //               children: [
      //                 SizedBox(
      //                   width: .030 * width,
      //                 ),
      //                 Container(
      //                   width: 0.31 * width,
      //                   height: 0.185 * height,
      //                   decoration: const BoxDecoration(
      //                       borderRadius: BorderRadius.all(Radius.circular(10)),
      //                       color: Color(0xffC0CEEF),
      //                       image: DecorationImage(
      //                           image: AssetImage('assets/images/tcs.png'))),
      //                 ),
      //                 SizedBox(
      //                   width: .030 * width,
      //                 ),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     const Text(
      //                       //'${jobs[0].eventName}'
      //                       'UI Engineer ',
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 21,
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: .005 * height,
      //                     ),
      //                     const Text(
      //                       'TCS',
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 15,
      //                       ),
      //                     ),
      //                   ],
      //                 )
      //               ],
      //             ),
      //             SizedBox(
      //               height: 0.025 * height,
      //             ),
      //             Row(
      //               children: [
      //                 SizedBox(
      //                   width: .030 * width,
      //                 ),
      //                 const Text(
      //                   'Applied on June 24 , 21:24',
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 13,
      //                   ),
      //                 ),
      //               ],
      //             )
      //           ],
      //         ),
      //      ),
      //    ),
      //  ),
    );
  }
}
