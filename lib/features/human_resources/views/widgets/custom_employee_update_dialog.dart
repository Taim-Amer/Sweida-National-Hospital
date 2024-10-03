import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/core/widgets/custom_text_field.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_employee_update_button.dart';

Future<dynamic> showCustomEmployeeUpdateDialog(BuildContext context, String name, int departmentID, int employeeID){
  TextEditingController newNameController = TextEditingController();
  TextEditingController newDepartmentController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      newNameController.text = name;
      newDepartmentController.text = departmentID.toString();
      return AlertDialog(
        title: const CustomDialogImage(image: "assets/logos/Screenshot_20240911-174957_Chrome-removebg-preview (2).png"),
        content: Column(
          children: [
            CustomTextField(
              controller: newNameController,
              label: "الاسم الجديد",
              type: TextInputType.name,
              validator: (value){},
            ),
            const SizedBox(height: Sizes.spaceBtwInputField),
            CustomTextField(
              controller: newDepartmentController,
              label: "القسم الجديد",
              type: TextInputType.name,
              validator: (value){},
            ),
          ],
        ),
        actions: [
          CustomEmployeeUpdateButton(newNameController: newNameController, newDepartmentIDController: newDepartmentController, employeeID: employeeID),
          const SizedBox(height: Sizes.spaceBtwItems),
          const CustomCancelButton()
        ],
      );
    },
  );
}