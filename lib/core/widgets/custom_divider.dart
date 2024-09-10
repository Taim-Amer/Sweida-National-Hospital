
import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';

class CustomDividerItem extends StatelessWidget {
  const CustomDividerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.spaceBtwItems),
      child: Container(
        width: 200,
        height: 1.0,
        color: whiteGreyColor,
      ),
    );
  }
}
