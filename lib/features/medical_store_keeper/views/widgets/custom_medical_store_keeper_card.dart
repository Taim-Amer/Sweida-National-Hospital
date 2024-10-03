import "package:flutter/material.dart";
import "package:hospital_management_system/core/styles/colors.dart";
import "package:hospital_management_system/core/styles/sizes.dart";
import "package:hospital_management_system/core/widgets/custom_button.dart";
import "package:hospital_management_system/core/widgets/text_items.dart";
import "package:hospital_management_system/features/medical_store_keeper/views/widgets/custom_medical_store_edit_dialog.dart";
import "package:hospital_management_system/features/medical_store_keeper/views/widgets/custom_medical_store_file_dialog.dart";
import "package:hospital_management_system/features/medical_store_keeper/views/widgets/custom_medical_store_keeper_delete_button.dart";

class CustomMedicalStoreKeeperCard extends StatelessWidget {
  const CustomMedicalStoreKeeperCard({super.key, required this.name, required this.endDate, required this.company, required this.quantity, required this.id});

  final String id;
  final String name;
  final String endDate;
  final String company;
  final String quantity;

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
            CustomMedicalStoreKeeperDeleteButton(id: int.parse(id)),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomButton(
              function: (){
                showCustomMedicalStoreEditDialog(context, int.parse(id), name, quantity);
              },
              text: "تعديل",
              width: 100,
            ),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomButton(
              function: (){
                showCustomMedicalStoreFileDialog(context, name, endDate, company, quantity);
              },
              text: "ملف",
              width: 100,
            ),
            const Spacer(),
            titleText("$name.$id", color: defaultDarkColor, size: 18),
            const SizedBox(width: Sizes.spaceBtwItems),
            const Icon(Icons.local_pharmacy_outlined, size: 40, color: Colors.teal),
          ],
        ),
      ),
    );
  }
}
