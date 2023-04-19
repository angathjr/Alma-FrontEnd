import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'HomeScreen.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/tkm.png',
          ),
          SizedBox(
            height: height * 0.3,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            child: Container(
              width: width * .8,
              height: height * .065,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color.fromARGB(255, 18, 18, 22),
                  border: Border.all(color: Color(0xff686868))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/google.png',
                  ),
                  SizedBox(
                    width: 0.03 * width,
                  ),
                  Text(
                    'Continue with Google',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.05 * height,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            child: Text(
              'By continuing you agree ALMA"s Terms of services & Privarcy Policy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ));
  }
}
