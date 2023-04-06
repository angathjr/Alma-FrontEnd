import 'package:flutter/material.dart';

import '../../core/constants.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:Colors.transparent,
      body: SafeArea(
        child: Container(
            width: width,
            height: height,

            child: Center(child: Text("calendar",style: Constants.txtStyle(),))),
      ),
    );
  }
}
