import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/features/deaths/model/all_deaths_model.dart';
import 'package:hospital_management_system/features/drawer/views/widgets/custom_deaths_list.dart';

Future<dynamic> showCustomDeathsDialog(BuildContext context, AllDeathsModel allDeathsModel){
  return showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: backgroundColor,
        title: const Center(child: Text("سجل الوفيات")),
        content: SizedBox(
          width: 700,
          height: 1000,
          child: CustomDeathsList(allDeathsModel: allDeathsModel),
        ),

      );
    },
  );
}