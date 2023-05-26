import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final EventSearchController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Search'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Column(children: [
              Container(
                alignment: Alignment.center,
                height: height * 0.065,
                decoration: BoxDecoration(
                    color: const Color(0xff1E1E1E),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(FeatherIcons.search),
                      hintText: "Search events here",
                      contentPadding: EdgeInsets.only(left: 20),
                      border: InputBorder.none),
                  onChanged: (value) => searchController.textFieldOnChanged(),
                  controller: searchController.searchTextController,
                ),
              ),
              SizedBox(
                height: 0.08 * width,
              ),
              Container(
                width: width * .9,
                height: height * .12,
                decoration: const BoxDecoration(
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
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 61, 64, 91),
                      ),
                    ),
                    SizedBox(
                      width: 0.04 * width,
                    ),
                    const Text(
                      'Tata Consultancy Services',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
