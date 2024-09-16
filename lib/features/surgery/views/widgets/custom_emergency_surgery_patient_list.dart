import 'package:flutter/material.dart';
import 'package:hospital_management_system/features/surgery/models/all_emergency_surgery_model.dart';
import 'custom_emergency_surgery_patient_card.dart';

class CustomEmergencySurgeryPatientList extends StatelessWidget {
  const CustomEmergencySurgeryPatientList({
    super.key,
    required this.allEmergencySurgeryModel,
  });

  final AllEmergencySurgeryModel allEmergencySurgeryModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allEmergencySurgeryModel.allPatientInSurgryQueue!.length,
      itemBuilder: (context, index) {
        var model = allEmergencySurgeryModel.allPatientInSurgryQueue![index];
        return CustomEmergencySurgeryPatientCard(
          fullName: model.patient!.fullName ?? "",
          id: model.patientId ?? 0,
          address: model.patient!.address ?? "",
          birthDate: model.patient!.dateOfBirth ?? "",
          motherName: model.patient!.momName ?? "",
          chain: model.patient!.chain ?? 0,
          gender: model.patient!.gender ?? "",
          caseDescription: model.patient!.caseDescription ?? "",
          treatmentRequired: model.patient!.treatmentRequired ?? "",
        );
      },
    );
  }
}
