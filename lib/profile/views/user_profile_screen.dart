import 'package:alma/auth/controllers/auth_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../core/constants.dart';
import '../../events/controllers/event_controller.dart';
import '../controllers/profile_controller.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  final AuthController authController = Get.find();
  final ProfileController profileController = Get.find();
  final EventsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double postSize = height * 0.6;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),

        // bio and intrested areas

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          sliver: SliverToBoxAdapter(
            child: Obx(
              () => profileController.isUserLoading.value
                  ? Center(
                      child: Container(),
                    )
                  : Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              "${profileController.selectedUser.value.firstName!.capitalizeFirst}",
                              style: const TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.only(right: 0.05 * width),
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: Colors.transparent,
                                    radius: width * 0.1,
                                    foregroundImage: CachedNetworkImageProvider(
                                      "${profileController.selectedUser.value.imageUrl}",
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.03 * height,
                      ),
                      Container(
                        width: width,
                        //height: 0.15 * height,
                        decoration: BoxDecoration(
                            color: Constants.cardColor().withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (profileController.selectedUser.value.bio != "")
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 0.04 * width, top: 0.01 * height),
                                child: const Text(
                                  'Bio:',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: 0.004 * height,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0.04 * width),
                              child: Text(
                                '${profileController.selectedUser.value.bio}',
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white60,
                                    fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              height: 0.01 * height,
                            ),
                            if (profileController
                                    .selectedUser.value.areaOfInterest !=
                                "")
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 0.04 * width, top: 0.01 * height),
                                child: const Text(
                                  'Interested Areas:',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: 0.004 * height,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0.04 * width),
                              child: Text(
                                profileController
                                    .selectedUser.value.areaOfInterest!
                                    .join(", "),
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white60),
                              ),
                            ),
                            SizedBox(
                              height: 0.01 * height,
                            ),
                            if (profileController.selectedUser.value.email !=
                                "")
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 0.04 * width, top: 0.01 * height),
                                child: const Text(
                                  'E-mail :',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: 0.004 * height,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0.04 * width),
                              child: Text(
                                '${profileController.selectedUser.value.email}',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white60),
                              ),
                            ),
                            SizedBox(
                              height: 0.01 * height,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.01 * height,
                      ),
                      Text(
                        "Posts",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      )
                    ]),
            ),
          ),

          //the post by user are placed hee
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          sliver: Obx(
            () => profileController.isEventsloading.value
                ? SliverToBoxAdapter(
                    child: SizedBox(
                        height: height * 0.6,
                        width: width,
                        child: CupertinoActivityIndicator(
                          radius: width * 0.04,
                        )))
                : profileController.userEvents.isEmpty
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
                                childCount: profileController.userEvents.length,
                                (BuildContext context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 100),
                            child: SlideAnimation(
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: const Duration(milliseconds: 1500),
                              verticalOffset: -50,
                              child: FadeInAnimation(
                                curve: Curves.fastLinearToSlowEaseIn,
                                duration: const Duration(milliseconds: 1500),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height * 0.01),
                                  child: SizedBox(
                                    width: width,
                                    child: InkWell(
                                      onTap: () {
                                        controller.gotoEvent(profileController
                                            .userEvents[index]);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        width: width,
                                        decoration: BoxDecoration(
                                            color: Constants.cardColor()
                                                .withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(15)),
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
                                                        BorderRadius.circular(
                                                            360),
                                                    child: SizedBox(
                                                        width: width * 0.11,
                                                        height: width * 0.11,
                                                        child: profileController
                                                                    .selectedUser
                                                                    .value
                                                                    .imageUrl ==
                                                                ''
                                                            ? Image.asset(
                                                                NOIMAGE)
                                                            : CachedNetworkImage(
                                                                progressIndicatorBuilder:
                                                                    (context,
                                                                            url,
                                                                            downloadProgress) =>
                                                                        Center(
                                                                          child: CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation(context.theme.disabledColor),
                                                                              value: downloadProgress.progress),
                                                                        ),
                                                                imageUrl:
                                                                    "${profileController.selectedUser.value.imageUrl}")),
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
                                                        "${profileController.selectedUser.value.firstName}",
                                                        style:
                                                            Constants.txtStyle()
                                                                .copyWith(
                                                                    fontSize:
                                                                        17),
                                                      ),
                                                      Text(
                                                        "1 hour ago",
                                                        style:
                                                            Constants.txtStyle()
                                                                .copyWith(
                                                                    fontSize:
                                                                        11),
                                                      )
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  SizedBox(
                                                      width: width * 0.07,
                                                      height: width * 0.07,
                                                      child: const Icon(
                                                        FeatherIcons
                                                            .moreHorizontal,
                                                        color: Colors.white,
                                                      ))
                                                ],
                                              ),
                                            ),

                                            SizedBox(
                                              height: postSize * 0.03,
                                            ),

                                            //The image of the post ,if there is no img the size of the card changes according to it

                                            if (profileController
                                                    .userEvents[index].imgUrl !=
                                                "")
                                              Container(
                                                height: postSize * 0.55,
                                                width: width,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: CachedNetworkImage(
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              Center(
                                                        child: CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation(
                                                                    context
                                                                        .theme
                                                                        .disabledColor),
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                      ),
                                                      imageUrl:
                                                          "${profileController.userEvents[index].imgUrl}",
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                            SizedBox(
                                              height: postSize * 0.06,
                                            ),
                                            Container(
                                              constraints: BoxConstraints(
                                                  maxHeight: (profileController
                                                              .userEvents[index]
                                                              .imgUrl !=
                                                          "")
                                                      ? postSize * 0.2
                                                      : postSize),
                                              //color: Colors.red,
                                              child: Text(
                                                  "${profileController.userEvents[index].eventDescription}",
                                                  maxLines: (profileController
                                                              .userEvents[index]
                                                              .imgUrl !=
                                                          "")
                                                      ? 5
                                                      : 20,
                                                  style: Constants.txtStyle()
                                                      .copyWith(fontSize: 12),
                                                  overflow:
                                                      TextOverflow.ellipsis),
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
    ));
  }
}
