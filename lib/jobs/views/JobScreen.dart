import 'package:flutter/material.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            height: 0.15 * height,
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
                      width: 0.21 * width,
                      height: 0.075 * height,
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
                        const Text(
                          'UI Engineer Intern',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: .005 * height,
                        ),
                        const Text(
                          'TCS',
                          style: TextStyle(
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
                    const Text(
                      'Applied on June 24 , 21:24',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 0.15 * height,
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
                      width: 0.21 * width,
                      height: 0.075 * height,
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
                        const Text(
                          'UI Engineer Intern',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: .005 * height,
                        ),
                        const Text(
                          'TCS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: .03 * height,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: .030 * width,
                    ),
                    const Text(
                      'Applied on June 24 , 21:24',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 0.15 * height,
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
                      width: 0.21 * width,
                      height: 0.075 * height,
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
                        const Text(
                          'UI Engineer Intern',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: .005 * height,
                        ),
                        const Text(
                          'TCS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: .03 * height,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: .030 * width,
                    ),
                    const Text(
                      'Applied on June 24 , 21:24',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 0.15 * height,
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
                      width: 0.21 * width,
                      height: 0.075 * height,
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
                        const Text(
                          'UI Engineer Intern',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: .005 * height,
                        ),
                        const Text(
                          'TCS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: .03 * height,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: .030 * width,
                    ),
                    const Text(
                      'Applied on June 24 , 21:24',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 0.15 * height,
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
                      width: 0.21 * width,
                      height: 0.075 * height,
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
                        const Text(
                          'UI Engineer Intern',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: .005 * height,
                        ),
                        const Text(
                          'TCS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: .03 * height,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: .030 * width,
                    ),
                    const Text(
                      'Applied on June 24 , 21:24',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
