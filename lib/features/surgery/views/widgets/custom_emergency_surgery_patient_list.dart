import 'package:flutter/material.dart';
import 'package:hospital_management_system/features/surgery/models/all_emergency_surgery_model.dart';
import 'custom_emergency_surgery_patient_card.dart';

class CustomEmergencySurgeryPatientList extends StatelessWidget {
  const CustomEmergencySurgeryPatientList({
    super.key, required this.allEmergencySurgeryModel,
  });

  final AllEmergencySurgeryModel allEmergencySurgeryModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allEmergencySurgeryModel.allPatientInSurgryQueue!.length,
      itemBuilder: (context, index){
        return CustomEmergencySurgeryPatientCard(fullName: allEmergencySurgeryModel.allPatientInSurgryQueue![index].patient!.fullName ?? "",);
      },
    );
  }
}
