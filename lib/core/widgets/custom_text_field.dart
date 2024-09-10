import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';

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
      this.prefixPressed,
      this.isPassword = false,
      this.color3 = whiteGreyColor,
      this.suffixColor = defaultLightColor});

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
  final Function? prefixPressed;
  final Color suffixColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondDarkColor.withOpacity(.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        enableInteractiveSelection: false,
        onTap: onTap,
        controller: controller,
        textAlign: TextAlign.right,
        onFieldSubmitted: onSubmit != null ? (s) => onSubmit!() : null,
        onChanged: onChange,
        validator: validator,
        keyboardType: type,
        obscureText: isPassword,
        cursorColor: defaultLightColor,
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
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: defaultLightColor, style: BorderStyle.none)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          prefixIcon: prefix != null
              ? IconButton(
                  icon: Icon(prefix),
                  color: defaultLightColor,
                  onPressed: (){
                    prefixPressed!();
                  },
                )
              : null,
          suffixIcon: suffix != null
              ? Icon(suffix, color: suffixColor)
              : null,
        ),
      ),
    );
  }
}
