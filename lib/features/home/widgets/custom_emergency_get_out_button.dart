import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/departments/cubit/departments_cubit.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';

class CustomEmergencyGetOutButton extends StatelessWidget {
  const CustomEmergencyGetOutButton({super.key, required this.patientID});

  final int patientID;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DepartmentsCubit, DepartmentsState>(
      listener: (context, state){
        if(state is GetOutEmergencySuccessState){
          showToast("تم تخريج المريض الاسعافي", ToastState.SUCCESS);
          navigateAndFinish(context, const DrawerLayout());
        }else if(state is GetOutEmergencyFailureState){
          showToast("حدث خطأ ما يرجى اعادة المحاولة لاحقا", ToastState.ERROR);
        }
      },
      builder: (context, state){
        return CustomButton(
          function: (){
            DepartmentsCubit.get(context).getOutEmergency(id: patientID);
          },
          text: "تخريج",
          // color: const Color(0xffedd382),
          color: defaultLightColor,
        );
      },
    );
  }
}
