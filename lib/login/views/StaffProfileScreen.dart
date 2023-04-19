import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StaffProfileScreen extends StatefulWidget {
  const StaffProfileScreen({super.key});

  @override
  State<StaffProfileScreen> createState() => _StaffProfileScreenState();
}

class _StaffProfileScreenState extends State<StaffProfileScreen> {
  @override
  final TextEditingController first_name_controller = TextEditingController();
  final TextEditingController last_name_controller = TextEditingController();
  final TextEditingController phone_number_controller = TextEditingController();
  final TextEditingController tkm_mail_controller = TextEditingController();
  final TextEditingController staff_id_controller = TextEditingController();
  final TextEditingController department_controller = TextEditingController();
  final TextEditingController designation_controller = TextEditingController();
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Complete Your  StaffProfileScreen Profile'),
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
              height: height * .62,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff13141B),
              ),
              
              child: Padding(
                padding:  EdgeInsets.all(width*0.06
                
                ),
                child: SingleChildScrollView(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                     Text('First Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),),
                      Container(
                        width: width * 02,
                        height: height * .053,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff25262E),
                        ),
                        child: TextFormField(
                            controller: first_name_controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                      ),
                      SizedBox(height: width*0.06,),
                      Text('Last Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),),
                    Container(
                        width: width * 02,
                        height: height * .053,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff25262E),
                        ),
                        child: TextFormField(
                            controller: last_name_controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                      ),
                      SizedBox(height: width*0.06,),
                      Text('Phone Number',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),),
                      Container(
                        width: width * 02,
                        height: height * .053,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff25262E),
                        ),
                        child: TextFormField(
                            controller: phone_number_controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                      ),
                       SizedBox(height: width*0.06,),
                       Text('TKM Mail id',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),),
                      Container(
                        width: width * 02,
                        height: height * .053,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff25262E),
                        ),
                        child: TextFormField(
                            controller: tkm_mail_controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                      ),
                      SizedBox(height: width*0.06,),
                      Text('Staff id',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),),
                      Container(
                        width: width * 02,
                        height: height * .053,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff25262E),
                        ),
                        child: TextFormField(
                            controller: staff_id_controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                      ),
                      SizedBox(height: width*0.08,),
                      Text('Designation',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),),
                      
                      Container(
                        width: width * 02,
                        height: height * .053,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff25262E),
                        ),
                        child: TextFormField(
                            controller: designation_controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                      ),
                       SizedBox(height: width*0.08,),
                      Text('Department',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),),
                      Container(
                        width: width * 02,
                        height: height * .053,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff25262E),
                        ),
                        child: TextFormField(
                            controller: department_controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            SizedBox(height: width*0.05,),
            Container(
              width: width * 0.35,
                    height: height * .053,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xff25262E),
                      
                    ),
                    child: Row(
                    children: [
                      Text("             Submit",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    ),
                    ],
                  ),
            ),

          ],
        ),
      ),
    );
  }
}
