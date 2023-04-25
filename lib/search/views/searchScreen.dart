import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  final TextEditingController search_controller=TextEditingController();
  Widget build(BuildContext context) {
    print("search");
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
         resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Search'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: width * .9,
              height: height * .07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff13141B),
              ),


              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 0.03 * width,
                  ),
                  Text(
                    'tcs',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 0.65 * width,
                  ),
                  Image.asset(
                    'assets/images/search.png',
                    height: height * .15,
                    scale: 2.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.04 * width,
            ),
            Container(
              width: width * .9,
              height: height * .12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff13141B),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 0.04 * width,
                  ),
                  Container(
                    width: width * .18,
                    height: height * .08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 61, 64, 91),
                    ),
                  ),
                  SizedBox(
                    width: 0.04 * width,
                  ),
                  Text(
                    'Tata Consultancy Services',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 0.04 * width,
            ),
            Container(
              width: width * .9,
              height: height * .12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff13141B),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 0.04 * width,
                  ),
                  Container(
                    width: width * .18,
                    height: height * .08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 61, 64, 91),
                    ),
                  ),
                  SizedBox(
                    width: 0.04 * width,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.04 * width,
            ),
            Container(
              width: width * .9,
              height: height * .12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff13141B),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 0.04 * width,
                  ),
                  Container(
                    width: width * .18,
                    height: height * .08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 61, 64, 91),
                    ),
                  ),
                  SizedBox(
                    width: 0.04 * width,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.04 * width,
            ),
            Container(
              width: width * .9,
              height: height * .12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff13141B),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 0.04 * width,
                  ),
                  Container(
                    width: width * .18,
                    height: height * .08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 61, 64, 91),
                    ),
                  ),
                  SizedBox(
                    width: 0.04 * width,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.04 * width,
            ),
            Container(
              width: width * .9,
              height: height * .12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff13141B),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 0.04 * width,
                  ),
                  Container(
                    width: width * .18,
                    height: height * .08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 61, 64, 91),
                    ),
                  ),
                  SizedBox(
                    width: 0.04 * width,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.04 * width,
            ),
          ],
        ),
      ),
    );
  }
}
