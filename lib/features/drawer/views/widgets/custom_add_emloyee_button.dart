import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_add_employee_dialog.dart';
import 'package:iconsax/iconsax.dart';

class CustomAddEmloyeeButton extends StatelessWidget {
  const CustomAddEmloyeeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: defaultLightColor,
        boxShadow: [
          BoxShadow(
            color: defaultLightColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        onPressed: () {
          showCustomAddEmployeeDialog(context);
        },
        splashColor: Colors.transparent,
        child: const ListTile(
          leading: Icon(Iconsax.add, color: thirdColor),
          title: Text(
            "اضافة موظف",
            style: TextStyle(
              fontSize:  18,
              color: thirdColor,
            ),
          ),
        ),
      ),
    );
  }
}
