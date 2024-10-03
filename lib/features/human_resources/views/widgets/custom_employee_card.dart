import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_absent_leave_button.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_absent_penalty_button.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_attendance_button.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_employee_delete_button.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_employee_update_dialog.dart';
import 'package:iconsax/iconsax.dart';

class CustomEmployeeCard extends StatelessWidget {
  const CustomEmployeeCard({super.key, required this.employeeID, required this.name, required this.departmentID});

  final int employeeID;
  final String name;
  final int departmentID;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Sizes.spaceBtwItems / 2),
      decoration: BoxDecoration(
        color: defaultLightColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomEmployeeDeleteButton(empID: employeeID,),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomButton(
              function: () {
                showCustomEmployeeUpdateDialog(context, name, departmentID, employeeID);
              },
              text: "تعديل",
              width: 100,
            ),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomAttendanceButton(employeeID: employeeID),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomAbsentLeaveButton(employeeID: employeeID),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomAbsentPenaltyButton(employeeID: employeeID),
            const Spacer(),
            titleText(name, color: defaultDarkColor, size: 18),
            const SizedBox(width: Sizes.spaceBtwItems),
            const Icon(Iconsax.verify, size: 40, color: Colors.green),
          ],
        ),
      ),
    );
  }
}




