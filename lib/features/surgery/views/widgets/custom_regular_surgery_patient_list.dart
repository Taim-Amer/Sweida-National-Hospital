import 'package:flutter/material.dart';
import 'package:hospital_management_system/features/surgery/models/all_regular_surgery_model.dart';
import 'package:hospital_management_system/features/surgery/views/widgets/custom_regular_surgery_patient_card.dart';

class CustomRegularSurgeryPatientList extends StatelessWidget {
  const CustomRegularSurgeryPatientList(
      {super.key, required this.allRegularSurgeryModel});

  final AllRegularSurgeryModel allRegularSurgeryModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allRegularSurgeryModel.allPatientInSurgryQueue!.length,
      itemBuilder: (context, index) {
        var model = allRegularSurgeryModel.allPatientInSurgryQueue![index];
        return CustomRegularSurgeryPatientCard(
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
