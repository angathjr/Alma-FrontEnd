import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/constants.dart';
import '../../profile/controllers/profile_controller.dart';

class AlumniDirectory extends StatelessWidget {
  const AlumniDirectory({super.key});
  @override
  Widget build(BuildContext context) {
     final ProfileController profileController = Get.find();
     double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
         leading: IconButton(
          onPressed: () {
            Get.back();

          },
          icon: const Icon(Iconsax.arrow_left_2)),
        title: const Text(
          'Alumni Directory',
          style: TextStyle(color: Colors.white),
        ),
        
      ),

     body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04 ,vertical: height *0.02),
       child: Container(
            width: width,
            height: height * .22,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Constants.cardColor().withOpacity(0.7),
            ),
            child: Row(
              children: [
               
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: height * 0.13,
                        width: width * .01,
                       
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                          radius: width * 0.1,
                          foregroundImage: CachedNetworkImageProvider(
                            "${profileController.user.value.imageUrl}",
                          )),
                      ),
                    ),
                  ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width *0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: height*0.02),
                        child: Text(
                          "${profileController.user.value.firstName}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        "Batch: ",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                       const Text(
                         "Current Company :",
                         overflow: TextOverflow.ellipsis,
                         maxLines: 4,
                         style: TextStyle(
                           fontSize: 14,
                         ),
                       ),
                      Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                               // onTap: () => 
                                child: Container(
                                  width: width * .2,
                                  height: height * .04,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color.fromARGB(255, 30, 31, 42),
                                  ),
                                  child: const Icon(
                                    FeatherIcons.mail,
                                    color: Colors.white,
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
    );
  }
}