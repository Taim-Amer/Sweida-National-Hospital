import "package:flutter/material.dart";
import "package:hospital_management_system/core/styles/sizes.dart";
import "package:hospital_management_system/core/widgets/custom_dialog_image.dart";
import "package:hospital_management_system/core/widgets/custom_text_field.dart";
import "package:hospital_management_system/features/deaths/views/widgets/custom_deaths_update_button.dart";
import "package:hospital_management_system/features/home/widgets/custom_cancel_button.dart";

Future<dynamic> showCustomNameEditDialog(BuildContext context, int deathID){
  TextEditingController newNameController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const CustomDialogImage(image: "assets/logos/Screenshot_20240911-174957_Chrome-removebg-preview (2).png"),

        content: CustomTextField(
          controller: newNameController,
          label: "الاسم الجديد",
          type: TextInputType.name,
          validator: (value){},
        ),
        actions: [
          CustomDeathsUpdateButton(deathID: deathID, newNameController: newNameController),
          const SizedBox(height: Sizes.spaceBtwItems),
          const CustomCancelButton()
        ],
      );
    },
  );
}
