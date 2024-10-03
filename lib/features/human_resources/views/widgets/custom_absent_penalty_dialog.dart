// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_date_picker.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';
import 'package:hospital_management_system/features/human_resources/cubit/human_resources_cubit.dart';

Future<dynamic> showCustomAbsentPenaltyDialog(BuildContext context, int employeeID){
  TextEditingController birthDateController = TextEditingController();

  return showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: backgroundColor,
        content: SizedBox(
          width: 300,
          height: 300,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomDialogImage(image: "assets/logos/Screenshot_20240911-174957_Chrome-removebg-preview (2).png"),
                CustomDatePicker(dateController: birthDateController, hint: "تاريخ الرجوع",),
              ],
            ),
          ),
        ),
        actions: [
          BlocConsumer<HumanResourcesCubit, HumanResourcesState>(
            listener: (context, state){
              if(state is AbsentPenaltySuccessState){
                showToast("تم ادراج عقوبة للموظف بنجاح", ToastState.SUCCESS);
                navigateAndFinish(context, const DrawerLayout());
              }else if(state is AbsentPenaltyFailureState){
                showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.ERROR);
              }
            },
            builder: (context, state){
              return CustomButton(
                function: (){
                  if(birthDateController != null){
                    HumanResourcesCubit.get(context).absentPenalty(
                      employeeID: employeeID,
                      date: birthDateController.text,
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