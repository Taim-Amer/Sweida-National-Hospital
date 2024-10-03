import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/features/human_resources/cubit/human_resources_cubit.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_all_attendance_dialog.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_employee_dialog.dart';
import 'package:iconsax/iconsax.dart';

class CustomAllAttendanceButton extends StatelessWidget {
  const CustomAllAttendanceButton({super.key});

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
          if(state is AllAttendanceInDateSuccessState){
            if(state.allAttendanceInDateModel.allAttInDate!.isEmpty){
              showToast("لا يوجد موظفين", ToastState.ERROR);
            }
            showAllAttendanceDialog(context, state.allAttendanceInDateModel);
          }else if(state is AllAttendanceInDateFailureState){
            showToast("لا يوجد موظفين", ToastState.ERROR);
          }
        },
        builder: (context, state){
          return MaterialButton(
            onPressed: () {
              HumanResourcesCubit.get(context).allAttendanceInDate();
            },
            splashColor: Colors.transparent,
            child: const ListTile(
              leading: Icon(Iconsax.square, color: thirdColor),
              title: Text(
                "سجل الحضور",
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
