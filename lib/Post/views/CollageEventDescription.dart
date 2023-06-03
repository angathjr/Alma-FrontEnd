import 'package:flutter/material.dart';

import '../../core/constants.dart';

class CollageEventDescriptionScreen extends StatefulWidget {
  const CollageEventDescriptionScreen({super.key});

  @override
  State<CollageEventDescriptionScreen> createState() => _CollageEventDescriptionScreenState();
}

class _CollageEventDescriptionScreenState extends State<CollageEventDescriptionScreen> {
  @override
  final TextEditingController event_name_controller = TextEditingController();
  final TextEditingController event_Date = TextEditingController();
  final TextEditingController event_time = TextEditingController();
  final TextEditingController venue = TextEditingController();
  final TextEditingController event_cordinator = TextEditingController();
  final TextEditingController condact = TextEditingController();
  final TextEditingController description_controller = TextEditingController();

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Collage Event Description"),
       
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: width * .97,
                  height: height * .769,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                   
                  ),
                  child: SingleChildScrollView(
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
                              decoration:  BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
color: Constants.cardColor().withOpacity(0.7)
                              ),
                              child: TextFormField(
                                controller: event_name_controller,
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
                              decoration:  BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Constants.cardColor().withOpacity(0.7),
                              ),
                              child: TextFormField(
                                controller: event_Date,
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
                              'Event Time',
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
                              decoration:  BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Constants.cardColor().withOpacity(0.7)
                              ),
                              child: TextFormField(
                                controller: event_time,
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
                              decoration:  BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                               color: Constants.cardColor().withOpacity(0.7)
                              ),
                              child: TextFormField(
                                controller: venue,
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
                              'Event Coordinator',
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
                              decoration:  BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Constants.cardColor().withOpacity(0.7)
                              ),
                              child: TextFormField(
                                controller: event_cordinator,
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
                              'Contact',
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
                              decoration:  BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Constants.cardColor().withOpacity(0.7)
                              ),
                              child: TextFormField(
                                controller: condact,
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
              SizedBox(
                height: width * 0.05,
              ),
              Container(
                alignment: Alignment.center,
                width: width * 0.35,
                height: height * .053,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                 color: Constants.cardColor().withOpacity(0.7)
                ),
                child: const Text(
                  "Post",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
