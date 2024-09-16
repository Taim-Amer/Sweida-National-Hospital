import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_file_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_surgery_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_test_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_transfer_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_xray_button.dart';
import 'package:hospital_management_system/features/login/views/widgets/login_body_widget.dart';
import 'package:iconsax/iconsax.dart';

class CustomRegularPatientCard extends StatelessWidget {
  CustomRegularPatientCard({super.key, required this.fullName, required this.id});

  final String fullName;
  final int id;

  TextEditingController targetDepartment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int? departmentID = int.tryParse(LoginBodyWidget.departmentController.text);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Sizes.spaceBtwItems / 2),
      decoration: BoxDecoration(
        color: defaultLightColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomRegularXrayButton(id: id),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomRegularTestButton(id: id),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomRegularFileButton(id: id),
            const SizedBox(width: Sizes.spaceBtwItems),
            departmentID == 16 || departmentID == 2 ? Column(
              children: [
                CustomRegularSurgeryButton(id: id),
                const SizedBox(width: Sizes.spaceBtwItems),
              ],
            ) : const SizedBox(),
            CustomRegularTransferButton(targetDepartment: targetDepartment, id: id),
            const Spacer(),
            titleText("$id.$fullName", color: defaultDarkColor, size: 18),
            const SizedBox(width: Sizes.spaceBtwItems),
            const Icon(Iconsax.verify, size: 40, color: Colors.green),
          ],
        ),
      ),
    );
  }
}


