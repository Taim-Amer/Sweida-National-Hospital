import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/features/tests/cubit/tests_cubit.dart';

class CustomEmergencyTestButton extends StatelessWidget {
  const CustomEmergencyTestButton({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestsCubit, TestsState>(
      listener: (context, state){
        if(state is EmergencyTestRequestSuccessState){
          showToast("تم اضافة المريض الاسعافي الى طابور الانتظار لقسم التحاليل", ToastState.SUCCESS);
        }else if(state is EmergencyTestRequestFailureState){
          showToast("حدث خطأ ما يرجى اعادة المحاولة لاحقا", ToastState.ERROR);
        }
      },
      builder: (context, state){
        return CustomButton(
          function: (){
            TestsCubit.get(context).emergencyTestRequest(patientID: id);
          },
          text: "تحاليل",
          width: 90,
          // color: const Color(0xffedd382),
          color: defaultLightColor,
        );
      },
    );
  }
}
