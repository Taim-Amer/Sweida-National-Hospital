import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/deaths/cubit/deaths_cubit.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';

class CustomDeathsUpdateButton extends StatelessWidget {
  const CustomDeathsUpdateButton({super.key, required this.deathID, required this.newNameController});

  final TextEditingController newNameController;
  final int deathID;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeathsCubit, DeathsState>(
      listener: (context, state){
        if(state is UpdateDeathSuccessState){
          showToast("تم تعديل الاسم بنجاح", ToastState.SUCCESS);
          navigateAndFinish(context, const DrawerLayout());
        }else if(state is UpdateDeathFailureState) {
          showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.ERROR);
        }
      },
      builder: (context, state){
        return CustomButton(
          function: (){
            DeathsCubit.get(context).updateDeath(name: newNameController.text, id: deathID);
          },
          text: "تعديل",
        );
      },
    );
  }
}