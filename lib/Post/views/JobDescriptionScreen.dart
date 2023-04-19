import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class job_des extends StatefulWidget {
  const job_des({super.key});

  @override
  State<job_des> createState() => _job_desState();
}

class _job_desState extends State<job_des> {
  
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
        title: Text("Job Description"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: width * .89,
              height: height * .76,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff13141B),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                  Padding(
                    padding: const EdgeInsets.fromLTRB(19,30,4,10),
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Color(0xff25262E),
                              ),
                               child: TextFormField(
                            controller: company_name_controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                            ),
                          ),
                           Padding(
                    padding: const EdgeInsets.fromLTRB(19,30,4,10),
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Color(0xff25262E),
                              ),
                               child: TextFormField(
                            controller: role_controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                            ),
                          ),
                           Padding(
                    padding: const EdgeInsets.fromLTRB(19,30,4,10),
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Color(0xff25262E),
                              ),
                               child: TextFormField(
                            controller: skill1_controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                            ),
                          ),
                           Padding(
                    padding: const EdgeInsets.fromLTRB(19,30,4,10),
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Color(0xff25262E),
                              ),
                               child: TextFormField(
                            controller: skill2_controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                            ),
                          ),
                           Padding(
                    padding: const EdgeInsets.fromLTRB(19,30,4,10),
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Color(0xff25262E),
                              ),
                               child: TextFormField(
                            controller: skill3_controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                            ),
                          ),
                           Padding(
                    padding: const EdgeInsets.fromLTRB(19,30,4,10),
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Color(0xff25262E),
                              ),
                               child: TextFormField(
                            controller: description_controller,
                            decoration: InputDecoration(
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
             SizedBox(
              height: width * 0.05,
            ),
            Container(
              alignment: Alignment.center,
                width: width * 0.35,
                height: height * .053,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xff25262E),
                ),
                child: Text(
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