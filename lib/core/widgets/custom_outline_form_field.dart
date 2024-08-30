import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/themes.dart';

class CustomOutlinedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color outlineColor;
  final double outlineWidth;
  final TextInputType type;
  final double width;
  final double height;
  final Color textColor;
  final Color hintColor;

  const CustomOutlinedTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.outlineColor = Colors.black,
    this.outlineWidth = 2.0,
    required this.type,
    this.width = double.infinity,
    this.height = 70,
    this.textColor = wightColor,
    this.hintColor = wightColor
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: defaultColor
      ),
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          height: height,
          width: width,
          child: TextFormField(
            enableInteractiveSelection: false,
            showCursor: false,
            keyboardType: type,
            controller: controller,
            style: TextStyle(
                color: textColor
            ),
            cursorColor: secondColor,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: hintColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: outlineColor,
                  width: 5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: secondColor,
                  width: outlineWidth,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: defaultColor.withOpacity(.5),
                  width: outlineWidth,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
