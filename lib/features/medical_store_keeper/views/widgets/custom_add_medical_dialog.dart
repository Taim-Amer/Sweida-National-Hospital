// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_date_picker.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/core/widgets/custom_text_field.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';
import 'package:hospital_management_system/features/medical_store_keeper/cubit/medical_store_keeper_cubit.dart';
import 'package:iconsax/iconsax.dart';

Future<dynamic> showCustomAddMedicalDialog(BuildContext context){
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController companyController = TextEditingController();

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
                  label: "اسم الدواء",
                  suffix: Iconsax.user,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: quantityController,
                  type: TextInputType.name,
                  validator: (value){},
                  label: "الكمية",
                  suffix: Iconsax.woman,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: companyController,
                  type: TextInputType.name,
                  validator: (value){},
                  label: "الشركة",
                  suffix: Iconsax.woman,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomDatePicker(dateController: endDateController, hint: "انتهاء الصلاحية")
              ],
            ),
          ),
        ),
        actions: [
          BlocConsumer<MedicalStoreKeeperCubit, MedicalStoreKeeperState>(
            listener: (context, state){
              if(state is StoreResourcesSuccessState){
                navigateAndFinish(context, const DrawerLayout());
              }
            },
            builder: (context, state){
              return CustomButton(
                function: (){
                  if(nameController.text != null && quantityController.text != null && companyController.text != null && endDateController.text != null){
                    MedicalStoreKeeperCubit.get(context).storeResources(
                      name: nameController.text,
                      quantity: quantityController.text,
                      endDate: endDateController.text,
                      company: companyController.text,
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