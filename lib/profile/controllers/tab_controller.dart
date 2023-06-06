import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var currentIndex = 0.obs;

  List<Tab> tabs = <Tab>[
    const Tab(
      icon: Text(
        "General",
      ),
    ),
    const Tab(
      icon: Text("More"),
    ),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }
}
