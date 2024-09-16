import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_text_field.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';
import 'package:hospital_management_system/features/patients/cubit/patients_cubit.dart';

Future<dynamic> showRegularTransferDialog(BuildContext context, TextEditingController targetDepartmentController, int patientID){
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
                const Image(image: NetworkImage("assets/logos/Screenshot_20240912-222951_Chrome-removebg-preview.png")),
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
          BlocConsumer<PatientsCubit, PatientsState>(
            listener: (context, state){
              if(state is RegularTransferSuccessState){
                showToast("تم تحويل المريض الى القسم المطلوب كمريض مقيم", ToastState.SUCCESS);
                navigateAndFinish(context, const DrawerLayout());
              }else if(state is RegularTransferFailureState){
                showToast("حدث خطأ ما الرجاء التأكد من المعلومات المدخلة ثم اعادة المحاولة", ToastState.ERROR);
              }
            },
            builder: (context, state){
              return Column(
                children: [
                  const SizedBox(height: Sizes.spaceBtwItems),
                  CustomButton(
                    function: (){
                      int? targetID = int.tryParse(targetDepartmentController.text);
                      PatientsCubit.get(context).regularTransfer(
                          patientID: patientID,
                          departmentID: targetID!
                      );
                    },
                    text: "تحويل الى القسم كمقيم",
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: Sizes.spaceBtwItems),
          const CustomCancelButton()
        ],
      );
    },
  );
}