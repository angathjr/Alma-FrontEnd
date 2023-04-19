import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Job extends StatelessWidget {
  const Job({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Job description"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
               width: width * .89,
              height: height * .765,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff13141B),
              ),
child: Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: width * .9,
                height: height * .07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 35, 37, 51),
                ),
      ),
    ),
    Container(
      width: width * .9,
                height: height * .07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 35, 37, 51),
                ),

    )
  ],
),
            ),
          ],
        ),
      ),
    );
  }
}