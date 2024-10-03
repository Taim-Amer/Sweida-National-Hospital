import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    required this.dateController,
    this.width = double.infinity,
    this.height = 50,
    this.hint = "تاريخ الميلاد",
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
    return Container(
      decoration: BoxDecoration(
        color: secondDarkColor.withOpacity(.4),
        borderRadius: BorderRadius.circular(10),
      ),
      height: height,
      width: width,
      child: TextField(
        enableInteractiveSelection: false,
        controller: dateController,
        keyboardType: TextInputType.none,
        style: const TextStyle(
            color: titleColor, fontStyle: FontStyle.normal
        ),
        cursorColor: secondLightColor,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: const Icon(Iconsax.calendar, color: defaultLightColor),
          // hintStyle: TextStyle(
          //   color: hintColor,
          // ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: outlineWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
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
