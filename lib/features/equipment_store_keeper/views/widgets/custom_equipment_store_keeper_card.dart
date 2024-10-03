import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/views/widgets/custom_equipment_store_edit_dialog.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/views/widgets/custom_equipment_store_keeper_delete_button.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/views/widgets/show_custom_medical_store_file_dialog.dart';
import 'package:iconsax/iconsax.dart';

class CustomEquipmentStoreKeeperCard extends StatelessWidget {
  const CustomEquipmentStoreKeeperCard({super.key, required this.id, required this.name, required this.description, required this.quantity});

  final int id;
  final String name;
  final String description;
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
            CustomEquipmentStoreKeeperDeleteButton(id: id),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomButton(
              function: (){
                showCustomEquipmentStoreEditDialog(context, id, name, quantity, description);
              },
              text: "تعديل",
              width: 100,
            ),
            const SizedBox(width: Sizes.spaceBtwItems),
            CustomButton(
              function: (){
                showCustomEquipmentStoreFileDialog(context, name, quantity, description);
              },
              text: "ملف",
              width: 100,
            ),
            const Spacer(),
            titleText("$name.$id", color: defaultDarkColor, size: 18),
            // const SizedBox(width: Sizes.spaceBtwItems),
            const Icon(Icons.electrical_services_rounded, size: 40, color: Colors.amber),
          ],
        ),
      ),
    );
  }
}
