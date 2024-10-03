import 'package:flutter/material.dart';
import 'package:hospital_management_system/features/medical_store_keeper/model/all_resources_model.dart';
import 'package:hospital_management_system/features/medical_store_keeper/views/widgets/custom_medical_store_keeper_card.dart';

class CustomMedicalStoreKeeperList extends StatelessWidget {
  const CustomMedicalStoreKeeperList({super.key, required this.allResoursesModel});

  final AllResoursesModel allResoursesModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allResoursesModel.allResource!.length,
      itemBuilder: (context, index){
        var model = allResoursesModel.allResource![index];
        return CustomMedicalStoreKeeperCard(
          id: model.id ?? "",
          name: model.name ?? "",
          endDate: model.endDate ?? "",
          company: model.company ?? "",
          quantity: model.quantity ?? "",
        );
      },
    );
  }
}
