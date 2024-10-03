import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/features/births/model/all_births_model.dart';
import 'package:hospital_management_system/features/births/views/widgets/custom_births_list.dart';
import 'package:hospital_management_system/features/deaths/views/widgets/custom_deaths_list.dart';

Future<dynamic> showCustomBirthsDialog(BuildContext context, AllBirthsModel allBirthsModel){
  return showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: backgroundColor,
        // title: const CustomDialogImage(image: "assets/logos/Screenshot_20240911-174957_Chrome-removebg-preview (2).png"),
        content: SizedBox(
          width: 700,
          height: 1000,
          child: CustomBirthsList(allBirthsModel: allBirthsModel),
        ),
        // actions: const [
        //   CustomCancelButton()
        // ],
      );
    },
  );
}