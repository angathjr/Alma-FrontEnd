import 'package:alma/core/constants.dart';
import 'package:alma/events/controllers/event_controller.dart';
import 'package:alma/home/views/drawer_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NewsFeedScreen extends StatelessWidget {
  NewsFeedScreen({Key? key}) : super(key: key);

  final EventsController controller = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double postSize = height * 0.6;

    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            drawer: NavigationDrawerScreen(),
            drawerEnableOpenDragGesture: true,
            backgroundColor: Colors.transparent,
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                      onPressed: () => _openDrawer(),
                      icon: const Icon(Iconsax.menu, color: Colors.white)),
                  pinned: false,
                  floating: true,
                  snap: true,
                  centerTitle: true,
                  title: const Text(
                    "Alma",
                  ),
                  backgroundColor: Colors.black,
                ),
                // CupertinoSliverRefreshControl(
                //   onRefresh: () async {
                //     controller.fetchEvents();
                //   },
                // ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  sliver: Obx(
                    () => controller.isEventsloading.value
                        ? SliverToBoxAdapter(
                            child: SizedBox(
                                height: height * 0.6,
                                width: width,
                                child: CupertinoActivityIndicator(
                                  radius: width * 0.04,
                                )))
                        : controller.events.isEmpty
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
                            : AnimationLimiter(
                                child: SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                        childCount: controller.events.length,
                                        (BuildContext context, index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 100),
                                    child: SlideAnimation(
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      duration:
                                          const Duration(milliseconds: 1500),
                                      verticalOffset: -50,
                                      child: FadeInAnimation(
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        duration:
                                            const Duration(milliseconds: 1500),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: height * 0.01),
                                          child: SizedBox(
                                            width: width,
                                            child: InkWell(
                                              onTap: () {
                                                controller.gotoEvent(
                                                    controller.events[index]);
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                width: width,
                                                decoration: BoxDecoration(
                                                    color: Constants.cardColor()
                                                        .withOpacity(0.65),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Column(
                                                  children: [
                                                    //Row that contains profile pic and name

                                                    SizedBox(
                                                      width: width,
                                                      height: postSize * 0.1,
                                                      child: Row(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        360),
                                                            child: SizedBox(
                                                                width: width *
                                                                    0.11,
                                                                height: width *
                                                                    0.11,
                                                                child: controller
                                                                            .events[
                                                                                index]
                                                                            .postedBy!
                                                                            .imgUrl ==
                                                                        ''
                                                                    ? Image.asset(
                                                                        NOIMAGE)
                                                                    : CachedNetworkImage(
                                                                        progressIndicatorBuilder: (context,
                                                                                url,
                                                                                downloadProgress) =>
                                                                            Center(
                                                                              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(context.theme.disabledColor), value: downloadProgress.progress),
                                                                            ),
                                                                        imageUrl:
                                                                            "${controller.events[index].postedBy!.imgUrl}")),
                                                          ),
                                                          SizedBox(
                                                            width: width * 0.02,
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "${controller.events[index].postedBy!.firstName}",
                                                                style: Constants
                                                                        .txtStyle()
                                                                    .copyWith(
                                                                        fontSize:
                                                                            17),
                                                              ),
                                                              Text(
                                                                "1 hour ago",
                                                                style: Constants
                                                                        .txtStyle()
                                                                    .copyWith(
                                                                        fontSize:
                                                                            11),
                                                              )
                                                            ],
                                                          ),
                                                          const Spacer(),
                                                          SizedBox(
                                                              width:
                                                                  width * 0.07,
                                                              height:
                                                                  width * 0.07,
                                                              child: const Icon(
                                                                FeatherIcons
                                                                    .moreHorizontal,
                                                                color: Colors
                                                                    .white,
                                                              ))
                                                        ],
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      height: postSize * 0.03,
                                                    ),

                                                    //The image of the post ,if there is no img the size of the card changes according to it

                                                    if (controller.events[index]
                                                            .imgUrl !=
                                                        "")
                                                      Container(
                                                        height: postSize * 0.55,
                                                        width: width,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child:
                                                                CachedNetworkImage(
                                                              progressIndicatorBuilder:
                                                                  (context, url,
                                                                          downloadProgress) =>
                                                                      Center(
                                                                child: CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation(context
                                                                            .theme
                                                                            .disabledColor),
                                                                    value: downloadProgress
                                                                        .progress),
                                                              ),
                                                              imageUrl:
                                                                  "${controller.events[index].imgUrl}",
                                                              fit: BoxFit.cover,
                                                            )),
                                                      ),
                                                    SizedBox(
                                                      height: postSize * 0.06,
                                                    ),
                                                    Container(
                                                      constraints: BoxConstraints(
                                                          maxHeight: (controller
                                                                      .events[
                                                                          index]
                                                                      .imgUrl !=
                                                                  "")
                                                              ? postSize * 0.2
                                                              : postSize),
                                                      //color: Colors.red,
                                                      child: Text(
                                                          "${controller.events[index].eventDescription}",
                                                          maxLines: (controller
                                                                      .events[
                                                                          index]
                                                                      .imgUrl !=
                                                                  "")
                                                              ? 5
                                                              : 20,
                                                          style: Constants
                                                                  .txtStyle()
                                                              .copyWith(
                                                                  fontSize: 12),
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                              ),
                  ),
                )
              ],
            )));
  }

  // The app bar of the home screen is set as an widget function here
}
