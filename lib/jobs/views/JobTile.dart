import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobTile extends StatelessWidget {
  const JobTile({
    super.key,
    required this.height,
    required this.width, this.event_name, 
  });

  final double height;
  final double width;
  
  final String? event_name;
 // final Function? press;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
    height: 0.15 * height,
    width: 0.87 * width,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Color(0xff1A1B27),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.015 * height,
        ),
        Row(
          children: [
            SizedBox(
              width: .030 * width,
            ),
            Container(
              width: 0.21 * width,
              height: 0.075 * height,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffC0CEEF),
                  image: DecorationImage(
                      image: AssetImage('assets/images/tcs.png'))),
            ),
            SizedBox(
              width: .030 * width,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                
                  "$event_name",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: .005 * height,
                ),
                const Text(
                  'TCS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 0.025 * height,
        ),
        Row(
          children: [
            SizedBox(
              width: .030 * width,
            ),
            const Text(
              'Applied on June 24 , 21:24',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ],
        )
      ],
    ),
          ),
          
          
         
         
        ]);
  }
}
