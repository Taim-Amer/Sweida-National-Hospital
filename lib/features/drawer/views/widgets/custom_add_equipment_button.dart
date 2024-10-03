import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/cubit/equipment_store_keeper_cubit.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/views/widgets/custom_add_equipment_dialog.dart';
import 'package:iconsax/iconsax.dart';

class CustomAddEquipmentButton extends StatelessWidget {
  const CustomAddEquipmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EquipmentStoreKeeperCubit, EquipmentStoreKeeperState>(
      listener: (context, state){
        if(state is StoreEquipmentsSuccessState){
          showToast("تمت اضافة العتاد بنجاح", ToastState.SUCCESS);
          navigateAndFinish(context, const DrawerLayout());
        }else if(state is StoreEquipmentsFailureState){
          showToast("حدث خطأ ما يرجى التأكد من معلومات المدخلة", ToastState.ERROR);
        }
      },
      builder: (context, state){
        return Container(
          height: 50,
          decoration: BoxDecoration(
            color: defaultLightColor,
            boxShadow: [
              BoxShadow(
                color: defaultLightColor.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: MaterialButton(
            onPressed: () {
              showCustomAddEquipmentDialog(context);
            },
            splashColor: Colors.transparent,
            child: const ListTile(
              leading: Icon(Iconsax.add, color: thirdColor),
              title: Text(
                "اضافة عتاد",
                style: TextStyle(
                  fontSize:  18,
                  color: thirdColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
