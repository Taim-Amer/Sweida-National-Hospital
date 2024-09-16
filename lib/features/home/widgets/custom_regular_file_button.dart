import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_patient_file_dialog.dart';
import 'package:hospital_management_system/features/patients/cubit/patients_cubit.dart';

class CustomRegularFileButton extends StatelessWidget {
  const CustomRegularFileButton({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientsCubit, PatientsState>(
      listener: (context, state){
        if(state is PatientFileSuccessState){
          showRegularPatientFileDialog(
            context,
            state.patientFileModel.data!.other!.departmentId?? 0,
            state.patientFileModel.data!.other!.patientId?? 0,
            state.patientFileModel.data!.patientInfo!.fullName ?? "",
            state.patientFileModel.data!.patientInfo!.address ?? "",
            state.patientFileModel.data!.patientInfo!.dateOfBirth ?? "",
            state.patientFileModel.data!.patientInfo!.momName ?? "",
            state.patientFileModel.data!.patientInfo!.gender ?? "",
          );
        }
      },
      builder: (context, state){
        return CustomButton(
          function: (){
            PatientsCubit.get(context).getPatientFile(patientID: id);
          },
          text: "الملف",
          width: 90,
          color: const Color(0xffdfb2f4),
        );
      },
    );
  }
}
