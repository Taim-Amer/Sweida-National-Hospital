import 'package:flutter/material.dart';
import 'package:hospital_management_system/features/departments/models/all_emergency_patient_model.dart';
import 'package:hospital_management_system/features/home/widgets/custom_emergency_patient_card.dart';

class CustomEmergencyPatientList extends StatelessWidget {
  const CustomEmergencyPatientList({super.key, required this.allEmergencyPatientModel});

  final AllEmergencyPatientModel allEmergencyPatientModel;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      // height: 500,
      child: ListView.builder(
        itemCount: allEmergencyPatientModel.allEmergencyPatient!.length,
        itemBuilder: (context, index) {
          var model = allEmergencyPatientModel.allEmergencyPatient![index];
          return CustomEmergencyPatientCard(
            id: model.id ?? 0,
            fullName: model.fullName ?? "",
            address: model.address ?? "",
            birthDate: model.dateOfBirth ?? "",
            motherName: model.momName ?? "",
            chain: model.chain ?? 0,
            gender: model.gender ?? "",
            caseDescription: model.caseDescription ?? "",
            treatmentRequired: model.treatmentRequired ?? "",
          );
        },
      ),
    );
  }
}
