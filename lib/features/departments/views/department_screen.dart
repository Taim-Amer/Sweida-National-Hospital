import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            defaultLightColor.withOpacity(0.75),
            Colors.white,
            secondDarkColor.withOpacity(0.3),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
// Container(
//   width: double.infinity,
//   height: 600,
//   child: Image(
//     fit: BoxFit.fill,
//     image: NetworkImage(
//       "assets/images/hospital_department.png",
//     ),
//   ),
// )
