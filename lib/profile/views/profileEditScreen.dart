import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController interestedAreasController =
      TextEditingController();

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
        child: Column(
          children: [
            Image.asset(
              'assets/images/pic.png',
              height: height * .15,
              scale: 1.1,
            ),
            Container(
              width: width * .89,
              height: height * .64,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff13141B),
              ),
              child: Padding(
                padding: EdgeInsets.all(width * 0.06),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'First Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        width: width * 02,
                        height: height * .053,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff25262E),
                        ),
                        child: TextFormField(
                          controller: firstNameController,
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
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        width: width * 02,
                        height: height * .053,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff25262E),
                        ),
                        child: TextFormField(
                          controller: lastNameController,
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
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        width: width * 02,
                        height: height * .053,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff25262E),
                        ),
                        child: TextFormField(
                          controller: phoneNumberController,
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
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        width: width * 02,
                        height: height * .053,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff25262E),
                        ),
                        child: TextFormField(
                          controller: mailController,
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
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        width: width * 02,
                        height: height * .053,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff25262E),
                        ),
                        child: TextFormField(
                          controller: bioController,
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
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        width: width * 02,
                        height: height * .053,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff25262E),
                        ),
                        child: TextFormField(
                          controller: interestedAreasController,
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
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xff25262E),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
