import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/cubit/equipment_store_keeper_cubit.dart';

class CustomEquipmentStoreKeeperDeleteButton extends StatelessWidget {
  const CustomEquipmentStoreKeeperDeleteButton({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EquipmentStoreKeeperCubit, EquipmentStoreKeeperState>(
      listener: (context, state){
        if(state is DeleteEquipmentsSuccessState){
          showToast("تم حذف العتاد من سجل مستودع المعدات", ToastState.SUCCESS);
          navigateTo(context, const DrawerLayout());
        }else if(state is DeleteEquipmentsFailureState){
          showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.ERROR);
        }
      },
      builder: (context, state){
        return CustomButton(
          function: (){
            EquipmentStoreKeeperCubit.get(context).deleteEquipments(id: id);
          },
          text: "حذف",
          width: 100,
          color: Colors.redAccent,
        );
      },
    );
  }
}
