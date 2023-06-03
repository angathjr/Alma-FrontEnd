import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

const String NOIMAGE = "assets/images/pic.png";

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
            colors: Constants.bgGradient));
  }

  static TextStyle txtStyle() => const TextStyle(
        fontSize: 21,
        color: Colors.white,
      );

  static cardColor() => const Color(0xff1A1A1A);

  static Widget backButtonWidget() => IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(
        Iconsax.arrow_left_2,
        color: Colors.white,
      ));
}
