
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class postScreen extends StatelessWidget {
  const postScreen({super.key});

  
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
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/pic.png',
                      height: height * .15,
                      scale: 2.5,
                    ),
                    SizedBox(
                      width: 0.03 * width,
                    ),
                    const Text(
                      'Shanil A V',
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
                children: [
                  SizedBox(
                    height: width * 0.06,
                  ),
                  Image.asset(
                    'assets/images/Post.png',
                  ),
                  SizedBox(
                    height: width * 0.06,
                  ),
                  const Text(
                    'esfdggujhgfvrtfscyjkhgvcrfdfgukjgcrtfggnijgctrgfhghikjghfcrtghghniokjhgfcrt',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.fromLTRB(250.0, 105.0, 20.0, 20),
                    child: Container(
                        width: width * .2,
                        height: height * .04,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromARGB(255, 30, 31, 42),
                        ),
                        child: Icon(Icons.add_to_photos_outlined),
                        ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: width * 0.06,
            ),
            Container(
              width: width * .3,
              height: height * .05,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff13141B),
              ),
              child: ElevatedButton(
                
                child: const Text('next'),
                onPressed: () {
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
