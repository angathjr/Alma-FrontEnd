import 'package:flutter/material.dart';


class JobDescriptionScreen extends StatefulWidget {
  const JobDescriptionScreen({super.key});

  @override
  State<JobDescriptionScreen> createState() => _JobDescriptionScreenState();
}

class _JobDescriptionScreenState extends State<JobDescriptionScreen> {
  
  @override
    final TextEditingController company_name_controller = TextEditingController();
    final TextEditingController role_controller = TextEditingController();
    final TextEditingController skill1_controller = TextEditingController();
    final TextEditingController skill2_controller = TextEditingController();
    final TextEditingController skill3_controller = TextEditingController();
    final TextEditingController description_controller = TextEditingController();
  
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Job Description"),
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
                      padding: EdgeInsets.fromLTRB(19,30,4,10),
                      child:
                      
                       Text(
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
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xff25262E),
                                ),
                                 child: TextFormField(
                              controller: company_name_controller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 5),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                              ),
                            ),
                             const Padding(
                      padding: EdgeInsets.fromLTRB(19,30,4,10),
                      child:
                      
                       Text(
                                'Role',
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
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xff25262E),
                                ),
                                 child: TextFormField(
                              controller: role_controller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 5),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                              ),
                            ),
                             const Padding(
                      padding: EdgeInsets.fromLTRB(19,30,4,10),
                      child:
                      
                       Text(
                                'Skills Required',
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
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xff25262E),
                                ),
                                 child: TextFormField(
                              controller: skill1_controller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 5),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                              ),
                            ),
                             const Padding(
                      padding: EdgeInsets.fromLTRB(19,30,4,10),
                      child:
                      
                       Text(
                                '',
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
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xff25262E),
                                ),
                                 child: TextFormField(
                              controller: skill2_controller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 5),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                              ),
                            ),
                             const Padding(
                      padding: EdgeInsets.fromLTRB(19,30,4,10),
                      child:
                      
                       Text(
                                '',
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
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xff25262E),
                                ),
                                 child: TextFormField(
                              controller: skill3_controller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 5),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                              ),
                            ),
                             const Padding(
                      padding: EdgeInsets.fromLTRB(19,30,4,10),
                      child:
                      
                       Text(
                                'Description',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                    ),
                            Center(
                              child: Container(
                                width: width * 0.8,
                                height: height * .53,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xff25262E),
                                ),
                                 child: TextFormField(
                              controller: description_controller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 5),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
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