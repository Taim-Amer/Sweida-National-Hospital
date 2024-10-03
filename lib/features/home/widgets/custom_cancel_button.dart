import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';

class CustomCancelButton extends StatelessWidget {
  const CustomCancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      function: (){
        Navigator.of(context).pop();
      },
      text: "رجوع",
      color: const Color(0xfff67e7d),
    );
  }
}