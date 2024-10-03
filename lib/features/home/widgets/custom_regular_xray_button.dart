import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/features/tests/cubit/tests_cubit.dart';

class CustomRegularXrayButton extends StatelessWidget {
  const CustomRegularXrayButton({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestsCubit, TestsState>(
      listener: (context, state){
        if(state is RegularXRayRequestSuccessState){
          showToast("تم اضافة المريض المقيم الى طابور الانتظار لقسم الصور الشعاعية", ToastState.SUCCESS);
        }else if(state is RegularXRayRequestFailureState){
          showToast("حدث خطأ ما يرجى اعادة المحاولة لاحقا", ToastState.ERROR);
        }
      },
      builder: (context, state){
        return CustomButton(
          function: (){
            TestsCubit.get(context).regularXrayRequest(patientID: id);
          },
          text: "صورة شعاعية",
          width: 100,
          color: defaultLightColor,
          // color: const Color(0xff55d6c2),
        );
      },
    );
  }
}
