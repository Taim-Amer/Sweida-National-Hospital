import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({super.key, this.function, required this.text, this.color});

  final VoidCallback? function;
  final String text;
  Color? color = defaultLightColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color
        ),
      ),
    );
  }
}
