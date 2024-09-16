import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_file_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_test_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_transfer_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_xray_button.dart';
import 'package:iconsax/iconsax.dart';

class CustomRegularSurgeryPatientCard extends StatelessWidget {
  CustomRegularSurgeryPatientCard({super.key, required this.fullName, required this.id, required this.address, required this.birthDate, required this.motherName, required this.chain, required this.gender, required this.caseDescription, required this.treatmentRequired});

  final int id;
  final String fullName;
  final String address;
  final String birthDate;
  final String motherName;
  final int chain;
  final String gender;
  final String caseDescription;
  final String treatmentRequired;

  TextEditingController targetDepartmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Sizes.spaceBtwItems / 2),
      decoration: BoxDecoration(
        color: defaultLightColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Row(
          children: [
            CustomRegularXrayButton(id: id),
            const SizedBox(
              width: Sizes.spaceBtwItems,
            ),
            CustomRegularTestButton(id: id),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomRegularFileButton(id: id),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomRegularTransferButton(targetDepartment: targetDepartmentController, id: id),
            const Spacer(),
            titleText(fullName, color: defaultDarkColor, size: 18),
            const SizedBox(width: Sizes.spaceBtwItems),
            const Icon(Iconsax.verify, size: 40, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
