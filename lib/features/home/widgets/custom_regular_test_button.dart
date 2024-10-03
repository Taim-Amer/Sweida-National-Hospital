import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/features/tests/cubit/tests_cubit.dart';

class CustomRegularTestButton extends StatelessWidget {
  const CustomRegularTestButton({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestsCubit, TestsState>(
      listener: (context, state){
        if(state is RegularTestRequestSuccessState){
          showToast("تم اضافة المريض المقيم الى طابور الانتظار لقسم التحاليل", ToastState.SUCCESS);
        }else if(state is RegularTestRequestFailureState){
          showToast("حدث خطأ ما يرجى اعادة المحاولة لاحقا", ToastState.ERROR);
        }
      },
      builder: (context, state){
        return CustomButton(
          function: (){
            TestsCubit.get(context).regularTestRequest(patientID: id);
          },
          text: "تحاليل",
          width: 90,
          color: defaultLightColor,
          // color: const Color(0xffedd382),
        );
      },
    );
  }
}