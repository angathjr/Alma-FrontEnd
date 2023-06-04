import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants.dart';
import '../controllers/profile_controller.dart';

class ProfileEditScreen extends StatelessWidget {
  ProfileEditScreen({super.key});

  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Edit Profile'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  width: width * 0.2,
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.transparent,
                      radius: 38,
                      foregroundImage: NetworkImage(
                        "${controller.user.value.imageUrl}",
                      ))),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: EdgeInsets.all(width * 0.06),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'First Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Constants.cardColor().withOpacity(0.7)),
                          child: TextFormField(
                            controller: controller.firstNameController,

                            // initialValue:firstNameController.text ,

                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.06,
                        ),
                        const Text(
                          'Last Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Constants.cardColor().withOpacity(0.7)),
                          child: TextFormField(
                            controller: controller.lastNameController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.06,
                        ),
                        const Text(
                          'Phone Number',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Constants.cardColor().withOpacity(0.7)),
                          child: TextFormField(
                            controller: controller.phoneNumberController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.06,
                        ),
                        const Text(
                          'Personal Mail id',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Constants.cardColor().withOpacity(0.7)),
                          child: TextFormField(
                            controller: controller.mailController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.06,
                        ),
                        const Text(
                          'Bio',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Constants.cardColor().withOpacity(0.7)),
                          child: TextFormField(
                            controller: controller.bioController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.06,
                        ),
                        const Text(
                          'Interested Areas',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: width * 02,
                          height: height * .053,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(10)),
                              color: Constants.cardColor().withOpacity(0.7)),
                          child: TextFormField(
                            controller: controller.interestedAreasController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: width * 0.05,
              ),
              Container(
                alignment: Alignment.center,
                width: width * 0.35,
                height: height * .053,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Constants.cardColor().withOpacity(0.7)),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
