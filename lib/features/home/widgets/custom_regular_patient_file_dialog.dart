import "package:flutter/material.dart";
import "package:hospital_management_system/core/styles/colors.dart";
import "package:hospital_management_system/core/styles/sizes.dart";
import "package:hospital_management_system/core/widgets/text_items.dart";
import "package:hospital_management_system/features/home/widgets/custom_cancel_button.dart";

Future<dynamic> showRegularPatientFileDialog(BuildContext context, int departmentID, int patientID, String fullName, String address, String birthDate, String motherName, String gender){
  return showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: backgroundColor,
        content: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                  height: 300,
                  width: 400,
                  child: Image(image: AssetImage("assets/logos/Screenshot_20240911-175004_Chrome-removebg-preview.png"))),
              const SizedBox(height: Sizes.spaceBtwSections,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: secondDarkColor.withOpacity(.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: titleText(departmentID.toString(), size: 16)),
              ),
              const SizedBox(height: Sizes.spaceBtwItems,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: secondDarkColor.withOpacity(.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: titleText(patientID.toString(), size: 16)),
              ),
              const SizedBox(height: Sizes.spaceBtwItems,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: secondDarkColor.withOpacity(.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: titleText(fullName, size: 16)),
              ),
              const SizedBox(height: Sizes.spaceBtwItems,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: secondDarkColor.withOpacity(.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: titleText(motherName, size: 16)),
              ),
              const SizedBox(height: Sizes.spaceBtwItems,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: secondDarkColor.withOpacity(.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: titleText(birthDate, size: 16)),

              ),
              const SizedBox(height: Sizes.spaceBtwItems,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: secondDarkColor.withOpacity(.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: titleText(address, size: 16)),
              ),
              const SizedBox(height: Sizes.spaceBtwItems,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: secondDarkColor.withOpacity(.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: titleText(gender, size: 16)),
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