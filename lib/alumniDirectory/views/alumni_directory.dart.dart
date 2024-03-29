import 'dart:ui';
import 'package:alma/alumniDirectory/controllers/alumni_dir_controller.dart';
import 'package:alma/alumniDirectory/views/alumni_filter_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/constants.dart';


class AlumniDirectoryScreen extends StatelessWidget {
  AlumniDirectoryScreen({super.key});

  final AlumniDirController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverAppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              pinned: true,
              leading: IconButton(
                  onPressed: () {
                    controller.clearControllers();
                  },
                  icon: const Icon(Iconsax.arrow_left_2)),
              floating: true,
              snap: true,
              titleSpacing: 20,
              title: const Text('Alumni Directory'),
              backgroundColor: Colors.black,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Iconsax.filter,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child:AlumniFilterScreen()
           
          ),
    );
                  },
                )
              ],
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
                                  color: Constants.cardColor().withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextField(
                                // onSubmitted: (value) =>
                                //     controller.searchAlumni(),
                                textAlign: TextAlign.left,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(FeatherIcons.search),
                                    hintText: "Search",
                                    contentPadding: EdgeInsets.only(left: 20),
                                    border: InputBorder.none),
                                controller: controller.searchTextController,
                                onChanged: (value) => controller.searchAlumni(),
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
                  () => (controller.isLoading.value ||
                          controller.isSearching.value)
                      ? SliverToBoxAdapter(
                          child: SizedBox(
                              height: height * 0.6,
                              width: width,
                              child: CupertinoActivityIndicator(
                                radius: width * 0.04,
                              )))
                      : controller.alumni.isEmpty
                          ? SliverToBoxAdapter(
                              child: SizedBox(
                                width: width,
                                height: height * 0.6,
                                child: Center(
                                  child: Text(
                                    "No Alumni",
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
                                      childCount: controller.alumni.length,
                                      (BuildContext context, index) {
                                return AnimationConfiguration.staggeredList(
                                    duration: const Duration(milliseconds: 100),
                                    position: index,
                                    child: SlideAnimation(
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      duration:
                                          const Duration(milliseconds: 1500),
                                      verticalOffset: -50,
                                      child: FadeInAnimation(
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        duration:
                                            const Duration(milliseconds: 1500),
                                        child: GestureDetector(
                                          onTap: () => controller.gotoProfile(
                                              controller.alumni[index].user!
                                                  .username!),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: height * 0.01),
                                            child: Container(
                                                width: width,
                                                height: height * .22,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Constants.cardColor()
                                                      .withOpacity(0.7),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: SizedBox(
                                                          height: height * 0.13,
                                                          width: width * .01,
                                                          child: CircleAvatar(
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              foregroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              radius:
                                                                  width * 0.1,
                                                              foregroundImage:
                                                                  CachedNetworkImageProvider(
                                                                "${controller.alumni[index].user!.imgUrl}",
                                                              )),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 7,
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    width *
                                                                        0.02),
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            height *
                                                                                0.02),
                                                                child:
                                                                    FittedBox(
                                                                  child: Text(
                                                                    "${controller.alumni[index].user!.firstName!.capitalizeFirst}",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 1,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                "Batch:   ${controller.alumni[index].academicYearFrom} - ${controller.alumni[index].academicYearTo}",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 4,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                              Text(
                                                                "Current Company : ${controller.alumni[index].currentCompany}",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 4,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomRight,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () =>
                                                                          controller
                                                                              .launchEmail("${controller.alumni[index].user!.email}"),
                                                                      child:
                                                                          Container(
                                                                        width: width *
                                                                            .2,
                                                                        height: height *
                                                                            .04,
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(10)),
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              30,
                                                                              31,
                                                                              42),
                                                                        ),
                                                                        child:
                                                                            const Icon(
                                                                          FeatherIcons
                                                                              .mail,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ]),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                    ));
                              })),
                            ),
                ))
          ],
        ));
  }
}

  //bottom model



