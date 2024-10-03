import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/births/views/widgets/custom_births_delete_button.dart';
import 'package:hospital_management_system/features/births/views/widgets/custom_births_file_dialog.dart';
import 'package:hospital_management_system/features/births/views/widgets/custom_births_update_dialog.dart';

class CustomBirthCard extends StatelessWidget {
  const CustomBirthCard({super.key, required this.fullName, required this.fatherName, required this.motherName, required this.birthDate, required this.city, required this.nationalID, required this.id});

  final String fullName;
  final String fatherName;
  final String motherName;
  final String birthDate;
  final String city;
  final String nationalID;
  final int id;

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
            CustomBirthsDeleteButton(birthID: id),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomButton(
              function: (){
                showCustomBirthsUpdateDialog(context, id, fullName, fatherName, motherName, city, birthDate);
              },
              text: "تعديل",
              width: 100,
            ),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomButton(
              function: (){
                showCustomBirthsFileDialog(context, fullName, fatherName, motherName, birthDate, city, nationalID);
              },
              text: "ملف",
              width: 100,
            ),
            const Spacer(),
            titleText("$fullName.$id", color: defaultDarkColor, size: 18),
          ],
        ),
      ),
    );
  }
}
