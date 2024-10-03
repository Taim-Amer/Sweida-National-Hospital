import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/core/widgets/custom_text_field.dart';
import 'package:hospital_management_system/features/births/views/widgets/custom_births_update_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';

Future<dynamic> showCustomBirthsUpdateDialog(BuildContext context, int id, String name, String fatherName, String motherName, String cityName, String birthDate){
  TextEditingController newNameController = TextEditingController();
  TextEditingController newFatherNameController = TextEditingController();
  TextEditingController newMotherNameController = TextEditingController();
  TextEditingController newCityNameController = TextEditingController();
  TextEditingController newBirthDateController = TextEditingController();

  return showDialog(
    context: context,
    builder: (context) {
      newNameController.text = name;
      newFatherNameController.text = fatherName;
      newMotherNameController.text = motherName;
      newCityNameController.text = cityName;
      newBirthDateController.text = birthDate;

      return AlertDialog(
        title: const CustomDialogImage(image: "assets/logos/Screenshot_20240911-174957_Chrome-removebg-preview (2).png"),

        content: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                controller: newNameController,
                label: "الاسم الجديد",
                type: TextInputType.name,
                validator: (value){},
              ),
              const SizedBox(height: Sizes.spaceBtwInputField),
              CustomTextField(
                controller: newFatherNameController,
                label: "اسم الاب الجديد",
                type: TextInputType.name,
                validator: (value){},
              ),
              const SizedBox(height: Sizes.spaceBtwInputField),
              CustomTextField(
                controller: newMotherNameController,
                label: "اسم الام الجديد",
                type: TextInputType.name,
                validator: (value){},
              ),
              const SizedBox(height: Sizes.spaceBtwInputField),
              CustomTextField(
                controller: newCityNameController,
                label: "اسم المدينة الجديد",
                type: TextInputType.name,
                validator: (value){},
              ),
              const SizedBox(height: Sizes.spaceBtwInputField),
              CustomTextField(
                controller: newBirthDateController,
                label: "تاريخ الجديد",
                type: TextInputType.name,
                validator: (value){},
              ),
              const SizedBox(height: Sizes.spaceBtwInputField),
            ],
          ),
        ),
        actions: [
          CustomBirthsUpdateButton(birthID: id, newNameController: newNameController, newFatherNameController: newFatherNameController, newMotherNameController: newMotherNameController, newCityNameController: newCityNameController, newBirthDateController: newBirthDateController),
          const SizedBox(height: Sizes.spaceBtwItems),
          const CustomCancelButton()
        ],
      );
    },
  );
}