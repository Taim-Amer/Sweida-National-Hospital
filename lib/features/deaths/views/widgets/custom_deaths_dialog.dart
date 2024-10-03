import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/features/deaths/model/all_deaths_model.dart';
import 'package:hospital_management_system/features/deaths/views/widgets/custom_deaths_list.dart';

Future<dynamic> showCustomDeathsDialog(BuildContext context, AllDeathsModel allDeathsModel){
  return showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: backgroundColor,
          // title: const CustomDialogImage(image: "assets/logos/Screenshot_20240911-174957_Chrome-removebg-preview (2).png"),
        content: SizedBox(
          width: 700,
          height: 1000,
          child: CustomDeathsList(allDeathsModel: allDeathsModel),
        ),
        // actions: const [
        //   CustomCancelButton()
        // ],
      );
    },
  );
}