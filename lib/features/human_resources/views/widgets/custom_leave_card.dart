import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:iconsax/iconsax.dart';

class CustomLeaveCard extends StatelessWidget {
  const CustomLeaveCard({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Sizes.spaceBtwItems / 2),
      decoration: BoxDecoration(
        color: defaultLightColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // CustomButton(
            //   function: () {
            //     showCustomEmployeeUpdateDialog(context, name, departmentID, employeeID);
            //   },
            //   text: "تعديل",
            //   width: 100,
            // ),
            const Spacer(),
            titleText(name, color: defaultDarkColor, size: 18),
            const SizedBox(width: Sizes.spaceBtwItems),
            const Icon(Iconsax.verify, size: 40, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
