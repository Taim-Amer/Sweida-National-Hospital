import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/features/surgery/cubit/surgery_cubit.dart';

class CustomEmergencySurgeryButton extends StatelessWidget {
  const CustomEmergencySurgeryButton({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurgeryCubit, SurgeryState>(
      listener: (context, state){
        if(state is AddEmergencySurgerySuccessState){
          showToast("تم اضافة المريض الى سجل العمليات الاسعافية في قسم الجراحة", ToastState.SUCCESS);
        }else if(state is AddEmergencySurgeryFailureState){
          showToast("حدث خطأ ما يرجى التأكد من المعلومات المدخلة او المحاولة لاحقا", ToastState.ERROR);
        }
      },
      builder: (context, state){
        return CustomButton(
          function: (){
            SurgeryCubit.get(context).addEmergencySurgery(patientID: id);
          },
          text: "عملية", width: 90,
        );
      },
    );
  }
}
