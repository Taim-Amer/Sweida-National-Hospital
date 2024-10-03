import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/features/human_resources/cubit/human_resources_cubit.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_absent_leave_dialog.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_all_leave_dialog.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_employee_dialog.dart';
import 'package:iconsax/iconsax.dart';

class CustomAllLeaveButton extends StatelessWidget {
  const CustomAllLeaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: defaultLightColor,
        boxShadow: [
          BoxShadow(
            color: defaultLightColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: BlocConsumer<HumanResourcesCubit, HumanResourcesState>(
        listener: (context, state){
          if(state is AllAbsentInDateSuccessState){
            if(state.allAbsentInDateModel!.allAbcentInDate!.isEmpty){
              showToast("لا يوجد موظفين", ToastState.ERROR);
            }
            showCustomAllLeaveDialog(context, state.allAbsentInDateModel);
          }else if(state is AllAbsentInDateFailureState){
            showToast("لا يوجد موظفين", ToastState.ERROR);
          }
        },
        builder: (context, state){
          return MaterialButton(
            onPressed: () {
              HumanResourcesCubit.get(context).allAbsentInDate();
            },
            splashColor: Colors.transparent,
            child: const ListTile(
              leading: Icon(Iconsax.square, color: thirdColor),
              title: Text(
                "سجل الاجازات",
                style: TextStyle(
                  fontSize:  18,
                  color: thirdColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
