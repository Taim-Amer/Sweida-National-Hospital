import 'package:flutter/material.dart';
import 'package:hospital_management_system/features/births/model/all_births_model.dart';
import 'package:hospital_management_system/features/births/views/widgets/custom_birth_card.dart';

class CustomBirthsList extends StatelessWidget {
  const CustomBirthsList({super.key, required this.allBirthsModel});

  final AllBirthsModel allBirthsModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allBirthsModel.allBirth!.length,
      itemBuilder: (context, index){
        var model = allBirthsModel.allBirth![index];
        return CustomBirthCard(
          id: model.id ?? 0,
          fullName: model.name ?? "",
          fatherName: model.fatherName ?? "",
          motherName: model.motherName ?? "",
          nationalID: model.nationalId ?? "",
          city: model.city ?? "",
          birthDate: model.birthDate ?? "",
        );
      },
    );
  }
}
