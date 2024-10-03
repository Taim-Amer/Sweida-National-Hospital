import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';

Future<dynamic> showCustomEquipmentStoreFileDialog(BuildContext context, String name, String quantity, String description){
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const CustomDialogImage(image: "assets/logos/Screenshot_20240911-174957_Chrome-removebg-preview (2).png"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: secondDarkColor.withOpacity(.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: titleText(name, size: 16)),
              ),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: secondDarkColor.withOpacity(.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: titleText(description, size: 16)),
              ),
              const SizedBox(
                height: Sizes.spaceBtwItems,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: secondDarkColor.withOpacity(.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: titleText(quantity, size: 16)),
              ),
            ],
          ),
        ),
        actions: const [
          CustomCancelButton()
        ],
      );
    },
  );
}