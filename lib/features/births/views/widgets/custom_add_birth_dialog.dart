// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_date_picker.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/core/widgets/custom_text_field.dart';
import 'package:hospital_management_system/features/births/cubit/births_cubit.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';
import 'package:iconsax/iconsax.dart';

Future<dynamic> showCustomAddBirthDialog(BuildContext context){
  TextEditingController nameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController nationalIDController = TextEditingController();

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
                  label: "اسم المولود",
                  suffix: Iconsax.user,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: fatherNameController,
                  type: TextInputType.name,
                  validator: (value){},
                  label: "اسم الاب",
                  suffix: Iconsax.user,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: motherNameController,
                  type: TextInputType.name,
                  validator: (value){},
                  label: "اسم الام",
                  suffix: Iconsax.woman,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomDatePicker(dateController: birthDateController),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: cityNameController,
                  type: TextInputType.name,
                  validator: (value){},
                  label: "المدينة",
                  suffix:  Iconsax.building,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: nationalIDController,
                  type: TextInputType.name,
                  validator: (value){},
                  label: "الرقم الوطني",
                  suffix:  Iconsax.code,
                ),
              ],
            ),
          ),
        ),
        actions: [
          BlocBuilder<BirthsCubit, BirthsState>(
            builder: (context, state){
              return CustomButton(
                function: (){
                  if(nameController.text != null && fatherNameController.text != null && motherNameController.text != null && cityNameController.text != null && birthDateController.text != null && nationalIDController.text != null){
                    BirthsCubit.get(context).storeBirth(
                        name: nameController.text,
                        fatherName: fatherNameController.text,
                        motherName: motherNameController.text,
                        birthDate: birthDateController.text,
                        city: cityNameController.text,
                        nationalID: nationalIDController.text,
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