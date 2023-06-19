import 'dart:ui';
import 'package:alma/alumniDirectory/controllers/alumni_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/constants.dart';
import '../../registration/controllers/registration_controller.dart';

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
                    filterWidget(context, height, width);
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
                                onSubmitted: (value) =>
                                    controller.searchAlumni(),
                                textAlign: TextAlign.left,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(FeatherIcons.search),
                                    hintText: "Search",
                                    contentPadding: EdgeInsets.only(left: 20),
                                    border: InputBorder.none),
                                controller: controller.searchTextController,
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

  //bottom model
  Future<dynamic> filterWidget(
      BuildContext context, double height, double width) {
    return showModalBottomSheet(
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
          child: Container(
            height: height * 0.3,
            width: width,
            decoration: BoxDecoration(
              color: Constants.cardColor(),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Sort by ",
                      style: TextStyle(fontSize: width * 0.06),
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.08, vertical: width * 0.05),
                      width: width,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Row(
                              children: [
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            const DialogueWidget1());
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.white12,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: height,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Year",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: width * 0.05,
                                                color: Colors.white),
                                          ),
                                          const Icon(Iconsax.calendar,
                                              color: Colors.white)
                                        ],
                                      )),
                                )),
                                SizedBox(
                                  width: width * .03,
                                ),
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            DialogWidget());
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.white12,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      height: height,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Department",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: width * 0.05,
                                                color: Colors.white),
                                          ),
                                          const Icon(Iconsax.courthouse,
                                              color: Colors.white)
                                        ],
                                      )),
                                )),
                              ],
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          )),
    );
  }
}

//dialogue for year

class DialogueWidget1 extends StatelessWidget {
  const DialogueWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      child: Container(
        height: height * 0.23,
        width: width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Constants.cardColor().withOpacity(0.7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Enter Batch',
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
            ),
            Container(
              width: width * .7,
              height: height * .051,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Constants.cardColor().withOpacity(0.9)),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "DD/MM/YYYY",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 5),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Container(
              width: width * 0.3,
              height: height * .053,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.5)),
              child: const Text(
                "sort",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//dialog for department
class DialogWidget extends StatelessWidget {
  DialogWidget({super.key});
  final RegistrationController registrationController = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      child: Container(
        height: height * 0.23,
        width: width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Constants.cardColor().withOpacity(0.7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Enter Department',
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
            ),
            Container(
                width: width * .7,
                height: height * .051,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Constants.cardColor().withOpacity(0.5)),
                child: Obx(
                  () => (registrationController.isdepartmentfetched.value ==
                          false)
                      ? const Center(child: CupertinoActivityIndicator())
                      : DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(20),
                              isExpanded: true,
                              isDense: false,
                              value: registrationController
                                  .selectedDepartment.value,
                              elevation: 0,
                              items: registrationController.depNames
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.037)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                registrationController.selectedDepartment
                                    .value = value.toString();
                              },
                            ),
                          ),
                        ),
                )),
            SizedBox(
              height: height * .05,
            ),
            Container(
              width: width * 0.3,
              height: height * .053,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.5)),
              child: const Text(
                "Sort",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
