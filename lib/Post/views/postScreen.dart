import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../profile/controllers/profile_controller.dart';

class postScreen extends StatelessWidget {
  postScreen({super.key});

  final ProfileController profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Create post'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width * .9,
                height: height * .07,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff13141B),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                          radius: 20,
                          foregroundImage: NetworkImage(
                            "${profileController.user.value.imageUrl}",
                          )),
                    ),
                    SizedBox(
                      width: 0.03 * width,
                    ),
                    Text(
                      "${profileController.user.value.firstName}",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: width * 0.06,
            ),
            Container(
              width: width * .89,
              height: height * .485,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff13141B),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff13141B),
              ),
              child:  Image.asset(
                  'assets/images/Post.png',
                ),
                 
                       
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff13141B),
              ),
                     
                      child: Column(children: [
                        Text("dhjbvjhdsbvjhdsbvkjldsbvkjldsnbvkjdsnvkjndbsvkjnsdjn;kj"),
                        // Text("${searchController.events[index].eventDescription}"),
                      ]),
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(10,10,10,10),
                     child: Container(
                      width: width * .2,
                      height: height * .04,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 30, 31, 42),
                      ),
                      child: Icon(Icons.add_to_photos_outlined),
                                     ),
                   ),
                ],

                // SizedBox(
                //   height: width * 0.06,
                // ),
                // Image.asset(
                //   'assets/images/Post.png',
                // ),
                // SizedBox(
                //   height: width * 0.06,
                // ),
                // const Text(
                //   'esfdggujhgfvrtfscyjkhgvcrfdfgukjgcrtfggnijgctrgfhghikjghfcrtghghniokjhgfcrt',
                //   style: TextStyle(
                //     fontSize: 10.0,
                //     color: Colors.white,
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(250.0, 105.0, 20.0, 20),
                //   child: Container(
                //     width: width * .2,
                //     height: height * .04,
                //     decoration: const BoxDecoration(
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //       color: Color.fromARGB(255, 30, 31, 42),
                //     ),
                //     child: Icon(Icons.add_to_photos_outlined),
                //   ),
                // )
              ),
            ),
            SizedBox(
              height: width * 0.06,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 30, 50),
                              child: Text(
                                'Your Post Belongs to',
                                style: TextStyle(fontSize: 23),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed('/job-description');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: width * .49,
                                height: height * .045,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(255, 54, 57, 79),
                                ),
                                child: const Text(
                                  "Job",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: width * 0.06,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed('/internship-description');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: width * .49,
                                height: height * .045,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(255, 54, 57, 79),
                                ),
                                child: const Text(
                                  "Internship",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: width * 0.06,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed('/collageEventdes-description');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: width * .49,
                                height: height * .045,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(255, 54, 57, 79),
                                ),
                                child: const Text(
                                  "Collage Events",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: width * 0.06,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed('/otherEventdes-description');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: width * .49,
                                height: height * .045,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(255, 54, 57, 79),
                                ),
                                child: const Text(
                                  "Other events",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: width * 0.09,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed('/job-description');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: width * .35,
                                height: height * .045,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(255, 48, 49, 61),
                                ),
                                child: const Text(
                                  "Next",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: width * .3,
                height: height * .05,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff13141B),
                ),
                child: const Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
