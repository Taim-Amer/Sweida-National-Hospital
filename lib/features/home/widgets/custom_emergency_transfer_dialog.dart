import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/core/widgets/custom_text_field.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/departments/cubit/departments_cubit.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';
import 'package:hospital_management_system/features/login/views/widgets/login_body_widget.dart';
import 'package:hospital_management_system/features/patients/cubit/patients_cubit.dart';

Future<dynamic> showEmergencyTransferDialog(BuildContext context, TextEditingController targetDepartmentController, int patientID){
  int? departmentID = int.tryParse(LoginBodyWidget.departmentController.text);
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomDialogImage(image: "assets/logos/Screenshot_20240912-222951_Chrome-removebg-preview.png"),
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
          ),
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
            text: "تحويل كمريض اسعافي",
          ),
          departmentID != 2 ? BlocConsumer<DepartmentsCubit, DepartmentsState>(
            listener: (context, state){
              if(state is AcceptResidentSuccessState){
                showToast("تم تحويل المريض الى مريض مقيم", ToastState.SUCCESS);
                navigateAndFinish(context, const DrawerLayout());
              }
            },
            builder: (context, state){
              return Column(
                children: [
                  const SizedBox(height: Sizes.spaceBtwItems),
                  CustomButton(
                    function: (){
                      DepartmentsCubit.get(context).acceptResident(patientId: patientID);
                      print("=============");

                    },
                    text: "تحويل الى مريض مقيم",
                  ),
                ],
              );
            },
          ) : const SizedBox(),
          const SizedBox(height: Sizes.spaceBtwItems),
          const CustomCancelButton()
        ],
      );
    },
  );
}