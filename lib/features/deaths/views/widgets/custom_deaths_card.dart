import "package:flutter/material.dart";
import "package:hospital_management_system/core/styles/colors.dart";
import "package:hospital_management_system/core/styles/sizes.dart";
import "package:hospital_management_system/core/widgets/custom_button.dart";
import "package:hospital_management_system/core/widgets/text_items.dart";
import "package:hospital_management_system/features/deaths/views/widgets/custom_death_file_dialog.dart";
import "package:hospital_management_system/features/deaths/views/widgets/custom_deaths_delete_button.dart";
import "package:hospital_management_system/features/deaths/views/widgets/custom_name_edit_dialog.dart";

class CustomDeathsCard extends StatelessWidget {
  const CustomDeathsCard({super.key, required this.fullName, required this.id, required this.fatherName, required this.motherName, required this.birthDate, required this.city, required this.nationalID, required this.deathDate, required this.deathHour, required this.reasonOfDeath});

  final String fullName;
  final String fatherName;
  final String motherName;
  final String birthDate;
  final String city;
  final String nationalID;
  final String deathDate;
  final String deathHour;
  final String reasonOfDeath;
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
            CustomDeathsDeleteButton(deathID: id),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomButton(
              function: (){
                showCustomNameEditDialog(context, id);
              },
              text: "تعديل",
              width: 100,
            ),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomButton(
              function: (){
                showCustomDeathFileDialog(context, fullName, fatherName, motherName, birthDate, city, nationalID, deathDate, deathHour, reasonOfDeath);
              },
              text: "ملف",
              width: 100,
            ),
            const Spacer(),
            titleText("$fullName.$id", color: defaultDarkColor, size: 18),
            const SizedBox(width: Sizes.spaceBtwItems),
            const Icon(Icons.cancel, size: 40, color: Colors.redAccent),
          ],
        ),
      ),
    );
  }
}
