import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/tests/cubit/tests_cubit.dart';

class CustomGetEmergencyXrayButton extends StatelessWidget {
  const CustomGetEmergencyXrayButton({super.key, required this.patientID});

  final int patientID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestsCubit(),
      child: BlocConsumer<TestsCubit, TestsState>(
        listener: (context, state) {
          if(state is GetEmergencyXraySuccessState){
            showToast("تم قبول المريض من طابور الانتظار", ToastState.SUCCESS);
            navigateAndFinish(context, const DrawerLayout());
          }else if(state is GetEmergencyXrayFailureState){
            showToast("حدث خطأ ما يرجى المحاولة لاحقا", ToastState.ERROR);
          }
        },
        builder: (context, state) {
          return CustomButton(
            function: () {
              TestsCubit.get(context).getEmergencyXray(patientID: patientID);
            },
            text: "قبول",
            width: 90,
            color: Colors.green,
          );
        },
      ),
    );
  }
}
