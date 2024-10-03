import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/deaths/views/widgets/custom_emergency_store_death_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_emergency_get_out_button.dart';

Future<dynamic> showEmergencyPatientFileDialog(BuildContext context, String fullName, String address, String birthDate, String motherName, String gender, int chain, int patientID){
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: backgroundColor,
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomDialogImage(image: "assets/logos/Screenshot_20240911-175004_Chrome-removebg-preview.png"),
              const SizedBox(height: Sizes.spaceBtwSections,),
              titleText("الاسم الكامل: $fullName" , size: 18),
              const SizedBox(height: Sizes.spaceBtwItems),
              titleText("عنوان الاقامة: $address", size: 18),
              const SizedBox(height: Sizes.spaceBtwItems),
              titleText("تاريخ الميلاد: $birthDate", size: 18),
              const SizedBox(height: Sizes.spaceBtwItems),
              titleText("اسم الام: $motherName", size: 18),
              const SizedBox(height: Sizes.spaceBtwItems),
              titleText("الجنس: $gender", size: 18),
              const SizedBox(height: Sizes.spaceBtwItems),
              titleText("رقم القيد: $chain", size: 18),
            ],
          ),
        ),
        actions: [
          CustomEmergencyStoreDeathButton(patientID: patientID),
          const SizedBox(height: Sizes.spaceBtwInputField),
          CustomEmergencyGetOutButton(patientID: patientID),
          const SizedBox(height: Sizes.spaceBtwInputField),
          const CustomCancelButton()
        ],
      );
    },
  );
}