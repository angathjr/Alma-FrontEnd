import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../controllers/search_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final EventSearchController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                snap: true,
                titleSpacing: 20,
                title: const Text('Search'),
                backgroundColor: Colors.black,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(height * 0.055 + 10),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 11,
                              child: Container(
                                alignment: Alignment.center,
                                height: height * 0.055,
                                decoration: BoxDecoration(
                                    color:
                                        Constants.cardColor().withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextField(
                                  onSubmitted: (value) =>
                                      searchController.searchEvents(),
                                  textAlign: TextAlign.left,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(FeatherIcons.search),
                                      hintText: "Search here",
                                      contentPadding: EdgeInsets.only(left: 20),
                                      border: InputBorder.none),
                                  controller:
                                      searchController.searchTextController,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                sliver: Obx(
                  () => searchController.isLoading.value
                      ? SliverToBoxAdapter(
                          child: SizedBox(
                              height: height * 0.6,
                              width: width,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              )))
                      : searchController.events.isEmpty
                          ? SliverToBoxAdapter(
                              child: SizedBox(
                                width: width,
                                height: height * 0.6,
                                child: Center(
                                  child: Text(
                                    "No Results",
                                    style: context.theme.textTheme.titleLarge
                                        ?.copyWith(
                                            color: Colors.white54,
                                            fontSize: width * 0.04),
                                  ),
                                ),
                              ),
                            )
                          : SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  childCount: searchController.events.length,
                                  (BuildContext context, index) {
                              return SearchCard(
                                  index: index,
                                  height: height,
                                  width: width,
                                  searchController: searchController);
                            })),
                ),
              ),
            ],
          )),
    );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
    required this.height,
    required this.width,
    required this.searchController,
    required this.index,
  });

  final double height;
  final double width;
  final int index;
  final EventSearchController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.005),
      child: Container(
          width: width,
          height: height * .22,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Constants.cardColor().withOpacity(0.65),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: height * 0.15,
                    width: width * .01,
                    //color: Colors.green,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "${searchController.events[index].imgUrl}}",
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                      child: Text(
                        "${searchController.events[index].eventName}",
                        style: const TextStyle(
                            fontSize: 32,
                            fontFamily: 'Helavtica',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${searchController.events[index].eventDescription}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Helavtica',
                        ),
                      ),
                    ),
                  ]),
                ),
              )
            ],
          )),
    );
  }
}
