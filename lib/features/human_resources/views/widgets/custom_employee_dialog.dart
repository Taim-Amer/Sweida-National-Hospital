import 'package:flutter/material.dart';
import 'package:hospital_management_system/features/human_resources/model/all_employee_model.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_employee_list.dart';

Future<dynamic> showAllEmployeeDialog(BuildContext context, AllEmployeeModel allEmployeeModel) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: const CustomDialogImage(
        //     image: "assets/logos/Screenshot_20240911-174957_Chrome-removebg-preview (2).png"),
        content: SizedBox(
          width: 800,
          height: 500,
          child: CustomEmployeeList(allEmployeeModel: allEmployeeModel,),
        ),
      );
    },
  );
}


