import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/cubit/equipment_store_keeper_cubit.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/views/widgets/custom_equipment_store_keeper_dialog.dart';
import 'package:hospital_management_system/features/medical_store_keeper/views/widgets/custom_medical_store_keeper_dialog.dart';
import 'package:iconsax/iconsax.dart';

class CustomEquipmentStoreButton extends StatelessWidget {
  const CustomEquipmentStoreButton({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: BlocProvider(
        create: (context) => EquipmentStoreKeeperCubit(),
        child: BlocConsumer<EquipmentStoreKeeperCubit, EquipmentStoreKeeperState>(
          listener: (context, state){
            if(state is AllEquipmentsSuccessState){
              showCustomEquipmentStoreKeeperDialog(context, state.allEquipmentsModel);
            }
          },
          builder: (context, state){
            return MaterialButton(
              onPressed: () {
                EquipmentStoreKeeperCubit.get(context).allEquipments();
              },
              splashColor: Colors.transparent,
              child: const ListTile(
                leading: Icon(Iconsax.square, color: thirdColor),
                title: Text(
                  "مستودع المعدات",
                  style: TextStyle(
                    fontSize:  18,
                    color: thirdColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
