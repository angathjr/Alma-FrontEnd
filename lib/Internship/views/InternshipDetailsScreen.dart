import 'package:flutter/material.dart';


class InternshipDetailsScreen extends StatelessWidget {
  const InternshipDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Internship Details'),),
    );
  }
}
