import 'package:flutter/material.dart';

import 'AlumniProfileScreen.dart';
import 'StaffProfileScreen.dart';
import 'StudentProfileScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Who are you?',
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AlumniProfileScreen()),
                );
              },
              child: Container(
                height: height * 0.2,
                width: width * 0.4,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/graduation 1.png')),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xff13141B)),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StaffProfileScreen()),
                    );
                  },
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/male 1.png')),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff13141B)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentProfileScreen()),
                    );
                  },
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/boy 1.png')),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff13141B)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
