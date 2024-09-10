import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/themes.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    required this.dateController,
    this.width = double.infinity,
    this.height = 50,
    this.hint = "Enter your birthdate",
    this.outlineColor = Colors.black,
    this.outlineWidth = 2.0,
    this.textColor = whiteColor,
    this.hintColor = whiteColor
  });

  final TextEditingController dateController;
  final double width;
  final double height;
  final String hint;
  final Color outlineColor;
  final double outlineWidth;
  final Color textColor;
  final Color hintColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        enableInteractiveSelection: false,
        controller: dateController,
        keyboardType: TextInputType.none,
        style: TextStyle(
          color: textColor,
        ),
        cursorColor: secondLightColor,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hint,
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
              color: secondLightColor,
              width: outlineWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: defaultLightColor.withOpacity(.5),
              width: outlineWidth,
            ),
          ),
        ),
        onTap: () {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.parse('2025-12-30'),
          ).then((value) {
            if (value != null) {
              dateController.text = DateFormat('yyyy-MM-dd').format(value);
            }
          });
        },
      ),
    );
  }
}
