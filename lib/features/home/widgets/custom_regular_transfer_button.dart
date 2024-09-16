import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_transfer_dialog.dart';
import 'package:hospital_management_system/features/patients/cubit/patients_cubit.dart';

class CustomRegularTransferButton extends StatelessWidget {
  const CustomRegularTransferButton({
    super.key,
    required this.targetDepartment,
    required this.id,
  });

  final TextEditingController targetDepartment;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientsCubit, PatientsState>(
      builder: (context, state){
        return CustomButton(
          function: (){
            return showRegularTransferDialog(context, targetDepartment, id);
          },
          text: "تحويل",
          width: 90,
          color: const Color(0xfff49097),
        );
      },
    );
  }
}