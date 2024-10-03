import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/features/deaths/cubit/deaths_cubit.dart';
import 'package:hospital_management_system/features/deaths/views/widgets/custom_store_death_dialog.dart';
import 'package:hospital_management_system/features/home/widgets/custom_emergency_patient_file_dialog.dart';

class CustomStoreDeathButton extends StatelessWidget {
  const CustomStoreDeathButton({super.key, required this.patientID});

  final int patientID;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeathsCubit, DeathsState>(
      builder: (context, state) {
        return CustomButton(
          function: () {
            return showStoreDeathDialog(context, patientID.toString());
          },
          text: "توفية",
          // width: 9,
          labelColor: whiteColor,
          // color: const Color(0xffdfb2f4),
          color: defaultLightColor,
        );
      },
    );
  }
}
