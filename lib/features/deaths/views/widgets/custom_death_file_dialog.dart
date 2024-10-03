import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';

Future<dynamic> showCustomDeathFileDialog(
  BuildContext context,
  String fullName,
  String fatherName,
  String motherName,
  String birthDate,
  String city,
  String nationalID,
  String deathDate,
  String deathHour,
  String reasonOfDeath,
) {
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
                child: Center(child: titleText(fullName, size: 16)),
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
                child: Center(child: titleText(fatherName, size: 16)),
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
                child: Center(child: titleText(motherName, size: 16)),
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
                child: Center(child: titleText(birthDate, size: 16)),
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
                child: Center(child: titleText(city, size: 16)),
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
                child: Center(child: titleText(nationalID, size: 16)),
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
                child: Center(child: titleText(deathDate, size: 16)),
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
                child: Center(child: titleText(deathHour, size: 16)),
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
                child: Center(child: titleText(reasonOfDeath, size: 16)),
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
