import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';

class CustomDialogImage extends StatelessWidget {
  const CustomDialogImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 100,
        width: 400,
        // decoration: BoxDecoration(
        //     // color: const Color(0xff4f646f).withOpacity(.2),
        //     color: const Color(0xff4f646f).withOpacity(.2),
        //     borderRadius: BorderRadius.circular(20)
        // ),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20),
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       const Color(0xff4f646f).withOpacity(.2),
        //       Colors.white,
        //       secondDarkColor.withOpacity(0.3),
        //     ],
        //   ),
        // ),
        child: Image(image: NetworkImage(image)));
  }
}