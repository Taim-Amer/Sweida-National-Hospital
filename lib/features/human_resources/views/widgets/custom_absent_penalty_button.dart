import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_absent_penalty_dialog.dart';

class CustomAbsentPenaltyButton extends StatelessWidget {
  const CustomAbsentPenaltyButton({super.key, required this.employeeID});

  final int employeeID;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      function: (){
        showCustomAbsentPenaltyDialog(context, employeeID);
      },
      text: "عقوبة",
      width: 100,
    );
  }
}
