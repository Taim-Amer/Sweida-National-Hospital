import "package:flutter/material.dart";
import "package:hospital_management_system/core/styles/colors.dart";
import "package:hospital_management_system/core/styles/sizes.dart";
import "package:hospital_management_system/core/widgets/custom_button.dart";
import "package:hospital_management_system/core/widgets/text_items.dart";
import "package:hospital_management_system/features/drawer/views/widgets/custom_deaths_delete_button.dart";
import "package:hospital_management_system/features/drawer/views/widgets/custom_name_edit_dialog.dart";

class CustomDeathsCard extends StatelessWidget {
  const CustomDeathsCard({super.key, required this.fullName, required this.id});

  final String fullName;
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
