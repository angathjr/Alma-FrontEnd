
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  var index = 0.obs;
  PageController controller = PageController(initialPage: 0, keepPage: true);


  void changePage(int index,PageController controller){
    controller.jumpToPage(index);
  }
}
