import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/features/medical_store_keeper/cubit/medical_store_keeper_cubit.dart';
import 'package:hospital_management_system/features/medical_store_keeper/views/widgets/custom_medical_store_keeper_dialog.dart';
import 'package:iconsax/iconsax.dart';

class CustomMedicalStoreButton extends StatelessWidget {
  const CustomMedicalStoreButton({super.key});

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
        create: (context) => MedicalStoreKeeperCubit(),
        child: BlocConsumer<MedicalStoreKeeperCubit, MedicalStoreKeeperState>(
          listener: (context, state){
            if(state is AllResourcesSuccessState){
              showCustomMedicalStoreKeeperDialog(context, state.allResoursesModel);
            }
          },
          builder: (context, state){
            return MaterialButton(
              onPressed: () {
                MedicalStoreKeeperCubit.get(context).allResources();
              },
              splashColor: Colors.transparent,
              child: const ListTile(
                leading: Icon(Iconsax.square, color: thirdColor),
                title: Text(
                  "مستودع الادوية",
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
