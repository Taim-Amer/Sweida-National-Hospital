import 'package:flutter/material.dart';
import 'package:hospital_management_system/features/surgery/models/all_regular_surgery_model.dart';
import 'package:hospital_management_system/features/surgery/views/widgets/custom_regular_surgery_patient_card.dart';

class CustomRegularSurgeryPatientList extends StatelessWidget {
  const CustomRegularSurgeryPatientList({super.key, required this.allRegularSurgeryModel});

  final AllRegularSurgeryModel allRegularSurgeryModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allRegularSurgeryModel.allPatientInSurgryQueue!.length,
      itemBuilder: (context, index){
        return CustomRegularSurgeryPatientCard(
          fullName: allRegularSurgeryModel.allPatientInSurgryQueue![index].patient!.fullName ?? "",
        );
      },
    );
  }
}
