import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_absent_leave_dialog.dart';

class CustomAbsentLeaveButton extends StatelessWidget {
  const CustomAbsentLeaveButton({super.key, required this.employeeID});

  final int employeeID;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      function: (){
        showCustomAbsentLeaveDialog(context, employeeID);
      },
      text: "اجازة",
      width: 100,
    );
  }
}
