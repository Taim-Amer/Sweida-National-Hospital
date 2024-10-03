// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_date_picker.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/core/widgets/custom_text_field.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';
import 'package:hospital_management_system/features/patients/cubit/patients_cubit.dart';
import 'package:iconsax/iconsax.dart';

Future<dynamic> showPatientAddDialog(BuildContext context, TextEditingController nameController, TextEditingController addressController, TextEditingController birthDateController, TextEditingController motherNameController, TextEditingController chainController, TextEditingController genderController, TextEditingController caseController, TextEditingController treatmentController){
  return showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: backgroundColor,
        content: SizedBox(
          width: 300,
          height: 500,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomDialogImage(image: "assets/logos/Screenshot_20240911-174957_Chrome-removebg-preview (2).png"),
                const SizedBox(height: Sizes.spaceBtwSections,),
                CustomTextField(
                  controller: nameController,
                  type: TextInputType.name,
                  validator: (value){},
                  label: "اسم المريض",
                  suffix: Iconsax.user,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: addressController,
                  type: TextInputType.name,
                  validator: (value){},
                  label: "العنوان",
                  suffix: Iconsax.home,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                // CustomTextField(
                //   controller: birthDateController,
                //   type: TextInputType.name,
                //   validator: (value){},
                //   label: "تاريخ الميلاد",
                //   suffix: Iconsax.calendar,
                // ),
                CustomDatePicker(dateController: birthDateController),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: motherNameController,
                  type: TextInputType.name,
                  validator: (value){},
                  label: "اسم الام",
                  suffix: Iconsax.woman,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: chainController,
                  type: TextInputType.name,
                  validator: (value){},
                  label: "رقم القيد",
                  suffix: Icons.numbers,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: genderController,
                  type: TextInputType.name,
                  validator: (value){},
                  label: "الجنس",
                  suffix:  Iconsax.man,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: caseController,
                  type: TextInputType.name,
                  validator: (value){},
                  label: "وصف الحالة",
                  suffix: Iconsax.health,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: treatmentController,
                  type: TextInputType.name,
                  validator: (value){},
                  label: "العلاج المطلوب",
                  suffix: Icons.local_pharmacy_outlined,
                ),
              ],
            ),
          ),
        ),
        actions: [
          BlocBuilder<PatientsCubit, PatientsState>(
            builder: (context, state){
              return CustomButton(
                function: (){
                  int? chain = int.tryParse(chainController.text);
                  if(nameController != null && addressController != null && birthDateController != null && motherNameController != null && chain != null && genderController != null && caseController != null && treatmentController != null){
                    PatientsCubit.get(context).addPatient(
                      fullName: nameController.text,
                      address: addressController.text,
                      dateOfBirth: birthDateController.text,
                      motherName: motherNameController.text,
                      chain: chain,
                      gender: genderController.text,
                      caseDescriptions: caseController.text,
                      treatmentRequired: treatmentController.text,
                    );
                  }
                },
                text: "اضافة",
              );
            },
          ),
          const SizedBox(height: Sizes.spaceBtwItems,),
          const CustomCancelButton()
        ],
      );
    },
  );
}
