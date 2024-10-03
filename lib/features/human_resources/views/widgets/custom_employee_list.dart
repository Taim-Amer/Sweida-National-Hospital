import 'package:flutter/material.dart';
import 'package:hospital_management_system/features/human_resources/model/all_employee_model.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_employee_card.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_employee_dialog.dart';

class CustomEmployeeList extends StatelessWidget {
  const CustomEmployeeList({
    super.key, required this.allEmployeeModel,
  });

  final AllEmployeeModel allEmployeeModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: allEmployeeModel.allEmployees!.length,
      itemBuilder: (context, index) {
        var model = allEmployeeModel.allEmployees![index];
        return CustomEmployeeCard(
          employeeID: model.id ?? 0,
          name: model.name ?? "",
          departmentID: model.departmentId ?? 0,
        );
      },
    );
  }
}
