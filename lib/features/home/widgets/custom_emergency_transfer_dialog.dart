import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_text_field.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';
import 'package:hospital_management_system/features/patients/cubit/patients_cubit.dart';

Future<dynamic> showEmergencyTransferDialog(BuildContext context, TextEditingController targetDepartmentController, int patientID){
  return showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: backgroundColor,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
                height: 300,
                width: 400,
                child: Image(image: AssetImage("assets/images/MoH_Logo-removebg-preview.png"))),
            const SizedBox(height: Sizes.spaceBtwSections,),
            CustomTextField(
              controller: targetDepartmentController,
              type: TextInputType.text,
              validator: (value){},
              label: "القسم المستهدف",
              suffix: Icons.numbers,
            ),
          ],
        ),
        actions: [
          CustomButton(
            function: (){
              int? targetID = int.tryParse(targetDepartmentController.text);
              PatientsCubit.get(context).emTransfer(
                patientID: patientID,
                targetDepartmentID: targetID!,
              );
            },
            text: "تحويل",
          ),
          const SizedBox(height: Sizes.spaceBtwItems),
          CustomCancelButton()
        ],
      );
    },
  );
}