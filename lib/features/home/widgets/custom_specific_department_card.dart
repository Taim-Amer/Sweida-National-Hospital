import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/departments/models/specific_department_model.dart';

class CustomSpecificDepartmentCard extends StatelessWidget {
  const CustomSpecificDepartmentCard({super.key, required this.specificDepartmentModel});

  final SpecificDepartmentModel specificDepartmentModel;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Sizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: defaultLightColor.withOpacity(.3),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.business,
                  color: Colors.blueAccent,
                  size: 28,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: titleText("Department Name :${specificDepartmentModel.depDetails!.name}"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.grey.shade300),
          ],
        ),
      ),
    );
  }
}
