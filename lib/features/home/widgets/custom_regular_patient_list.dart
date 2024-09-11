import 'package:flutter/material.dart';
import 'package:hospital_management_system/features/departments/models/all_patient_in_department_model.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_patient_card.dart';

class CustomRegularPatientList extends StatelessWidget {
  const CustomRegularPatientList({super.key, required this.allPatientInDepartmentModel});

  final AllPatientInDepartmentModel allPatientInDepartmentModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: allPatientInDepartmentModel.allPatientThisDepartment!.length,
        itemBuilder: (context, index){
          return CustomRegularPatientCard(
            fullName: allPatientInDepartmentModel.allPatientThisDepartment![index].patientName!,
            id: allPatientInDepartmentModel.allPatientThisDepartment![index].patientId!,
          );
        },
    );
  }
}
