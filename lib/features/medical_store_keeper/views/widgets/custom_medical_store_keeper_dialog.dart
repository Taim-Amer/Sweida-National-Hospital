import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/features/medical_store_keeper/model/all_resources_model.dart';
import 'package:hospital_management_system/features/medical_store_keeper/views/widgets/custom_medical_store_keeper_list.dart';

Future<dynamic> showCustomMedicalStoreKeeperDialog(BuildContext context, AllResoursesModel allResourcesModel){
  return showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: backgroundColor,
        title: const CustomDialogImage(image: "assets/logos/Screenshot_20240911-174957_Chrome-removebg-preview (2).png"),
        content: SizedBox(
          width: 700,
          height: 1000,
          child: CustomMedicalStoreKeeperList(allResoursesModel: allResourcesModel),
        ),
        // actions: const [
        //   CustomCancelButton()
        // ],
      );
    },
  );
}