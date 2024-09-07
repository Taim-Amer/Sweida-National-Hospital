import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';

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
      decoration: BoxDecoration(
        color: defaultLightColor,
        boxShadow: [
          BoxShadow(
            color: defaultLightColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
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
    );
  }
}
