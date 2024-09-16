import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/home/widgets/custom_emergency_file_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_emergency_surgery_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_emergency_test_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_emergency_transfer_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_emergency_xray_button.dart';
import 'package:iconsax/iconsax.dart';

class CustomEmergencySurgeryPatientCard extends StatelessWidget {
  CustomEmergencySurgeryPatientCard({
    super.key, required this.fullName, required this.id, required this.address, required this.birthDate, required this.motherName, required this.chain, required this.gender, required this.caseDescription, required this.treatmentRequired,
  });

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomEmergencyXrayButton(id: id),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomEmergencyTestButton(id: id),
            const SizedBox(width: Sizes.spaceBtwItems,),
            CustomEmergencyFileButton(fullName: fullName, address: address, birthDate: birthDate, motherName: motherName, gender: gender, chain: chain),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomEmergencyTransferButton(targetDepartmentController: targetDepartmentController, id: id),
            const Spacer(),
            titleText(fullName, color: defaultDarkColor, size: 18),
            const SizedBox(width: Sizes.spaceBtwItems),
            const Icon(Iconsax.warning_2, size: 40, color: Colors.redAccent),        ],
        ),
      ),
    );
  }
}
