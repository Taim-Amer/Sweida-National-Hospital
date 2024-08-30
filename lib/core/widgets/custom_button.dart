// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/themes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.function,
      required this.text,
      this.width = double.infinity,
      this.isUpperCase = true,
      this.radius = 10,
      });
  final Function function;
  final String text;
  final double width;
  final bool isUpperCase;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: width,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        splashColor: Colors.transparent,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: wightColor,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: defaultColor,
        boxShadow: [
          BoxShadow(
            color: defaultColor!.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            defaultColor.withOpacity(.8),
            secondColor,
            // wightGreyColor
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
