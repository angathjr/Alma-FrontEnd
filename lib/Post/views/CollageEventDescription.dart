import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants.dart';
import '../controllers/post_controller.dart';

class CollageEventDescriptionScreen extends StatelessWidget {
  CollageEventDescriptionScreen({super.key});

  final PostController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
              controller.clearControllers();
            },
            icon: const Icon(Iconsax.arrow_left_2)),
        title: const Text("Collage Event Description"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.004),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(19, 30, 4, 6),
                            child: Text(
                              'Event name',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: width * 0.8,
                              height: height * .053,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Constants.cardColor().withOpacity(0.7)),
                              child: TextFormField(
                                controller: controller.eventName,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 5),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(19, 15, 4, 6),
                            child: Text(
                              'Event Date',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              
                              width: width * 0.8,
                              height: height * .053,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Constants.cardColor().withOpacity(0.7),
                              ),
                              
                              child: TextFormField(
                                
                                controller: controller.startDate,
                                decoration:  InputDecoration(
                                  icon: IconButton(onPressed: ()=>_showDatePicker(context), icon: Icon(Icons.abc)),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 5),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          
                          const Padding(
                            padding: EdgeInsets.fromLTRB(19, 15, 4, 6),
                            child: Text(
                              'Venue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: width * 0.8,
                              height: height * .053,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Constants.cardColor().withOpacity(0.7)),
                              child: TextFormField(
                                controller: controller.venue,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 5),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          
                        ]),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => controller.addCollegeAndOtherEvent(),
                child: Container(
                  alignment: Alignment.center,
                  width: width * 0.35,
                  height: height * .053,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Constants.cardColor().withOpacity(0.7)),
                  child: const Text(
                    "Post",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}


 void _showDatePicker(ctx) {
   DateTime? _chosenDateTime;
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 500,
              color: Color.fromARGB(255, 238, 22, 22),
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: CupertinoDatePicker(mode: CupertinoDatePickerMode.date,
                      maximumYear: 2045,
                      minimumYear: 2023,
                      dateOrder:DatePickerDateOrder.ymd ,
                        //initialDateTime: DateTime.now(),
                        onDateTimeChanged: (val) {
                          // setState(() {
                          //   _chosenDateTime = val;
                          // });
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: const Text('OK'),
                    color: Colors.amber,
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }
  
 