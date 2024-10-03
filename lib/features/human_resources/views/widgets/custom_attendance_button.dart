import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_attendance_dialog.dart';

class CustomAttendanceButton extends StatelessWidget {
  const CustomAttendanceButton({super.key, required this.employeeID});

  final int employeeID;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      function: (){
        showCustomAttendanceDialog(context, employeeID);
      },
      text: "حضور",
      width: 100,
    );
  }
}
