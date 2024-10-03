import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/deaths/cubit/deaths_cubit.dart';
import 'package:hospital_management_system/features/home/home_screen.dart';

class CustomDeathsDeleteButton extends StatelessWidget {
  const CustomDeathsDeleteButton({super.key, required this.deathID});

  final int deathID;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeathsCubit, DeathsState>(
      listener: (context, state){
        if(state is DeleteDeathSuccessState){
          showToast("تم حذف حالة الوفاة من سجل الوفيات", ToastState.SUCCESS);
          navigateTo(context, const HomeScreen());
        }else if(state is DeleteDeathFailureState){
          showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.ERROR);
        }
      },
      builder: (context, state){
        return CustomButton(
          function: (){
            DeathsCubit.get(context).deleteDeath(id: deathID);
          },
          text: "حذف",
          width: 100,
          color: Colors.redAccent,
        );
      },
    );
  }
}