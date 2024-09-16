import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_emergency_patient_file_dialog.dart';
import 'package:hospital_management_system/features/patients/cubit/patients_cubit.dart';

class CustomEmergencyFileButton extends StatelessWidget {
  const CustomEmergencyFileButton({
    super.key,
    required this.fullName,
    required this.address,
    required this.birthDate,
    required this.motherName,
    required this.gender,
    required this.chain,
  });

  final String fullName;
  final String address;
  final String birthDate;
  final String motherName;
  final String gender;
  final int chain;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientsCubit, PatientsState>(
      builder: (context, state) {
        return CustomButton(
          function: () {
            return showEmergencyPatientFileDialog(context, fullName, address, birthDate, motherName, gender, chain);
          },
          text: "الملف",
          width: 90,
          labelColor: whiteColor,
          color: const Color(0xffdfb2f4),
        );
      },
    );
  }
}
