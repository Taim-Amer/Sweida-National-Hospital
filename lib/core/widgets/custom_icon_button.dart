import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/themes.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.icon, required this.function});

  final Icon icon;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondDarkColor.withOpacity(.3),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: icon,
        color: defaultLightColor,
        iconSize: 30.0,
        onPressed: function,
      ),
    );
  }
}

