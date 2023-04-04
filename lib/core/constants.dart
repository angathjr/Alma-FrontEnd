import 'package:flutter/material.dart';

class Constants {
  static var bgGradient = const [
    Color(0xff110D21),
    Color(0xff06070B),
    Color(0xff06070B),
    Color(0xff0D0E18),
  ];

  //background gradient for all pages

  static BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.red,
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.01, .25, .75, 1],
            colors: Constants.bgGradient)
    );
  }


  static TextStyle txtStyle ()=>const TextStyle(
    fontSize: 25,
    color: Colors.white
  );
}
