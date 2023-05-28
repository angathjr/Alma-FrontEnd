import 'package:flutter/material.dart';

class InternshipDescriptionScreen extends StatefulWidget {
  const InternshipDescriptionScreen({super.key});

  @override
  State<InternshipDescriptionScreen> createState() =>
      _InternshipDescriptionScreenState();
}

class _InternshipDescriptionScreenState
    extends State<InternshipDescriptionScreen> {
  @override
  final TextEditingController company_name_controller = TextEditingController();
  final TextEditingController skill1_controller = TextEditingController();
  final TextEditingController time1_controller = TextEditingController();
  final TextEditingController time2_controller = TextEditingController();
 

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Internship Description"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width * .89,
                height: height * .76,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff13141B),
                ),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(19, 30, 4, 10),
                          child: Text(
                            'Company name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: width * 0.8,
                            height: height * .053,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xff25262E),
                            ),
                            child: TextFormField(
                              controller: company_name_controller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 5),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(19, 15, 4, 10),
                          child: Text(
                            'Skill Required',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: width * 0.8,
                            height: height * .053,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xff25262E),
                            ),
                            child: TextFormField(
                              controller: skill1_controller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 5),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        
                        const Padding(
                          padding: EdgeInsets.fromLTRB(19, 15, 4, 10),
                          child: Text(
                            'Time',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Center(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 27),
                                child: Container(
                                  width: width * 0.35,
                                  height: height * .053,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color(0xff25262E),
                                  ),
                                  child: TextFormField(
                                    controller: time1_controller,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "From",
                                      contentPadding: EdgeInsets.only(left: 5),
                                    ),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  width: width * 0.35,
                                  height: height * .053,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color(0xff25262E),
                                  ),
                                  child: TextFormField(
                                    controller: time2_controller,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "To",
                                      contentPadding: EdgeInsets.only(left: 5),
                                    ),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                      ]),
                ),
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
              child: const Text(
                "Post",
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
