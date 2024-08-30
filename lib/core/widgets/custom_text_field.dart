import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/themes.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.type,
      this.onSubmit,
      this.onChange,
      this.onTap,
      required this.validator,
      this.label,
      this.prefix,
      this.color1,
      this.color2,
      this.suffix,
      this.suffixPressed,
      this.isPassword = false,
      this.color3 =wightGreyColor,
      });

  final TextEditingController controller;
  final TextInputType type;
  final Function? onSubmit;
  final ValueChanged<String>? onChange;
  final VoidCallback? onTap;
  final bool isPassword;
  final String? Function(String?) validator;
  final String? label;
  final IconData? prefix;
  final Color? color1;
  final Color? color2;
  final Color color3;
  final IconData? suffix;
  final Function? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [defaultColor, secondColor, color3]),
        color: defaultColor.withOpacity(.30),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        enableInteractiveSelection: false,
        onTap: onTap,
        controller: controller,
        onFieldSubmitted: onSubmit != null ? (s) => onSubmit!() : null,
        onChanged: onChange,
        validator: validator,
        keyboardType: type,
        obscureText: isPassword,
        cursorColor: defaultColor,
        style: const TextStyle(color: titleColor, fontStyle: FontStyle.normal),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(14.0),
          enabledBorder: InputBorder.none,
          errorBorder: UnderlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: label,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: defaultColor, style: BorderStyle.none)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          prefixIcon: Icon(
            prefix,
            color: defaultColor,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixPressed!();
                  },
                  icon: Icon(
                    suffix,
                  ))
              : null,
        ),
      ),
    );
  }
}
