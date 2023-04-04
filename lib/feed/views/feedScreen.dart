import 'package:alma/core/constants.dart';
import 'package:flutter/material.dart';
class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
            height: height,
            decoration: Constants.buildBoxDecoration(),
            child: Center(child: Text("newsfeed",style: Constants.txtStyle(),))),
      ),
    );
  }
}
