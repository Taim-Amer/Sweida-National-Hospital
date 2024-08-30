import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';

Widget titleText(String title , {double size = 25 , Color color = titleColor}) => Text(
  title,
  style: TextStyle(
      letterSpacing: 2,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      fontSize: size,
      color: titleColor
  ),
);

Widget detailsText(String title , {double size = 20 , Color color = textColor}) => Text(
  title,
  style: TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: size,
      color: color
  ),
);

Widget subTitleText(String title , {double size = 20 ,Color color = textColor}) => Text(
  title,
  style: TextStyle(
      fontStyle: FontStyle.italic,
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w600
  ),
);