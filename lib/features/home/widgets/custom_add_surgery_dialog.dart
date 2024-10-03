import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/core/widgets/custom_text_field.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';
import 'package:hospital_management_system/features/surgery/cubit/surgery_cubit.dart';
import 'package:iconsax/iconsax.dart';

Future<dynamic> showSurgeryAddDialog(BuildContext context, TextEditingController patientIdController){
  int? patientID = int.tryParse(patientIdController.text);
  return showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: backgroundColor,
        content: SizedBox(
          width: 300,
          height: 400,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomDialogImage(image: "assets/logos/Screenshot_20240914-091717_Chrome-removebg-preview.png"),
                CustomTextField(
                  controller: patientIdController,
                  type: TextInputType.number,
                  validator: (value){},
                  label: "رقم المريض",
                  suffix: Iconsax.hashtag,
                ),
              ],
            ),
          ),
        ),
        actions: [
          BlocConsumer<SurgeryCubit, SurgeryState>(
            listener: (context, state){},
            builder: (context, state){
              return CustomButton(
                function: (){
                  SurgeryCubit.get(context).addRegularSurgery(patientID: patientID!);
                },
                text: "اضافة عملية",
              );
            },
          ),
          const SizedBox(height: Sizes.spaceBtwItems,),
          BlocConsumer<SurgeryCubit, SurgeryState>(
            listener: (context, state){},
            builder: (context, state){
              return CustomButton(
                function: (){
                  SurgeryCubit.get(context).addEmergencySurgery(patientID: patientID!);
                },
                text: "اضافة عملية اسعافية",
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