import 'dart:ui';
import 'package:alma/Post/controllers/post_controller.dart';
import 'package:alma/core/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../profile/controllers/profile_controller.dart';
import 'event_type_selection_screen.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});

  final ProfileController profileController = Get.find();
  final PostController postController = Get.find();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Create post'),
      ),
      body: GestureDetector(
        onTap: () async {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Constants.cardColor().withOpacity(0.7)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.transparent,
                            radius: 20,
                            foregroundImage: CachedNetworkImageProvider(
                              "${profileController.user.value.imageUrl}",
                            )),
                      ),
                      SizedBox(
                        width: 0.03 * width,
                      ),
                      Text(
                        "${profileController.user.value.firstName}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.02,
              ),
              Expanded(
                flex: 26,
                child: Container(
                  width: width,
                  // height: height * .67,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Constants.cardColor().withOpacity(0.7),
                  ),
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //to show the selected image

                        Expanded(
                            flex: 10,
                            child: Column(
                              children: [
                                if (postController.isImageSelected.value ==
                                    true)
                                  Stack(
                                    children: [
                                      Container(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          height: height * 0.26,
                                          width: width * 0.8,
                                          decoration: BoxDecoration(
                                              // color: Colors.amber,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image(
                                              fit: BoxFit.cover,
                                              image: FileImage(postController
                                                  .selectedImage.value),
                                            ),
                                          )),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () => postController
                                              .removeSelectedImage(),
                                          child: Icon(
                                            Iconsax.close_circle,
                                            size: width * 0.07,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                Expanded(
                                    child: SizedBox(
                                        width: width,
                                        child: TextFormField(
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width * 0.038),
                                          textAlign: TextAlign.justify,
                                          maxLines: null,
                                          controller:
                                              postController.description,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.all(width * 0.03),
                                              hintText:
                                                  "Add the event description here",
                                              hintStyle: const TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.white,
                                                  fontSize: 16),
                                              border: InputBorder.none),
                                        )))
                              ],
                            )),

                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () => postController.pickImage(),
                                child: Container(
                                  width: width * .2,
                                  height: height * .04,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color.fromARGB(255, 30, 31, 42),
                                  ),
                                  child: const Icon(
                                    Iconsax.document_upload,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.02,
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      isDismissible: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      useSafeArea: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      builder: (context) => BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                          child: EventSelectionScreen(
                            height: height,
                            width: width,
                          )),
                    );
                  },
                  child: Container(
                    width: width,
                    height: height * .05,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Constants.cardColor(),
                    ),
                    child: const Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
