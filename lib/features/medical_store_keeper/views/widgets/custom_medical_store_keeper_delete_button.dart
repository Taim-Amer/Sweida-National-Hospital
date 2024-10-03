import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/home/home_screen.dart';
import 'package:hospital_management_system/features/medical_store_keeper/cubit/medical_store_keeper_cubit.dart';

class CustomMedicalStoreKeeperDeleteButton extends StatelessWidget {
  const CustomMedicalStoreKeeperDeleteButton({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalStoreKeeperCubit, MedicalStoreKeeperState>(
      listener: (context, state){
        if(state is DeleteResourcesSuccessState){
          showToast("تم حذف الدواء من سجل مستودع الادوية", ToastState.SUCCESS);
          navigateAndFinish(context, const DrawerLayout());
        }else if(state is DeleteResourcesFailureState){
          showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.ERROR);
        }
      },
      builder: (context, state){
        return CustomButton(
          function: (){
            MedicalStoreKeeperCubit.get(context).deleteResources(id: id);
          },
          text: "حذف",
          width: 100,
          color: Colors.redAccent,
        );
      },
    );
  }
}