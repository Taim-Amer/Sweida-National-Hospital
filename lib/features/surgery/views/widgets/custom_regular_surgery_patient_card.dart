import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/surgery/models/all_regular_surgery_model.dart';
import 'package:iconsax/iconsax.dart';

class CustomRegularSurgeryPatientCard extends StatelessWidget {
  const CustomRegularSurgeryPatientCard({super.key, required this.fullName});

  final String fullName;

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
            CustomButton(
              function: (){},
              text: "تحاليل",
              width: 90,
              color: Colors.pinkAccent,
            ),
            const Spacer(),
            titleText(fullName, color: defaultDarkColor, size: 18),
            const SizedBox(width: Sizes.spaceBtwItems),
            const Icon(Iconsax.verify, size: 40, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
