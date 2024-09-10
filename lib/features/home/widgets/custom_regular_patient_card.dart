import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:iconsax/iconsax.dart';

class CustomRegularPatientCard extends StatelessWidget {
  const CustomRegularPatientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Sizes.defaultSpace / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: defaultDarkColor.withOpacity(.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    const Icon(Iconsax.heart, color: Colors.red, size: 30,),
                    const SizedBox(width: 2),
                    titleText("Taim Amer", size: 18, color: secondDarkColor),
                  ],
                ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  const Icon(Iconsax.location, size: 24, color: Colors.green),
                  const SizedBox(width: 1),
                  titleText("Sweida", size: 14, color: secondDarkColor.withOpacity(.8)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
