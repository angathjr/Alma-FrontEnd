import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../search/controllers/search_controller.dart';

class NavController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    // GetXDependancyInjector().onInit();
    super.onInit();
  }

  final EventSearchController searchController = Get.find();

  var index = 0.obs;

  PageController controller = PageController(initialPage: 0, keepPage: true);

  void changePage(int index, PageController controller) {
    controller.jumpToPage(index);
    searchController.clearSearchResults();
  }
}
