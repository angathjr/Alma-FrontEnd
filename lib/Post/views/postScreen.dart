import 'package:flutter/material.dart';


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
      
      body: SingleChildScrollView(
        
        
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.04),
          
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
                height: height * .665,
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
                      padding: const EdgeInsets.fromLTRB(250.0, 260.0, 20.0, 20),
                      child: Container(
                          width: width * .2,
                          height: height * .04,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(255, 30, 31, 42),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.02,
                              ),
                              Image.asset(
                                'assets/images/ADD.png',
                              ),
                            ],
                          )),
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
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 1.0, horizontal: .8),
                      child: Text(
                        '        Next',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
