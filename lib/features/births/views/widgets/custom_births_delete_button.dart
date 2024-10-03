import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/births/cubit/births_cubit.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';

class CustomBirthsDeleteButton extends StatelessWidget {
  const CustomBirthsDeleteButton({super.key, required this.birthID});

  final int birthID;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BirthsCubit, BirthsState>(
      listener: (context, state){
        if(state is DeleteBirthSuccessState){
          showToast("تم حذف حالة الولادة من سجل الوفيات", ToastState.SUCCESS);
          navigateAndFinish(context, const DrawerLayout());
        }else if(state is DeleteBirthFailureState){
          showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.ERROR);
        }
      },
      builder: (context, state){
        return CustomButton(
          function: (){
            BirthsCubit.get(context).deleteBirth(id: birthID);
          },
          text: "حذف",
          width: 100,
          color: Colors.redAccent,
        );
      },
    );
  }
}
