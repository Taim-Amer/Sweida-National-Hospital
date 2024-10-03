import 'package:flutter/material.dart';
import 'package:hospital_management_system/features/deaths/model/all_deaths_model.dart';
import 'package:hospital_management_system/features/deaths/views/widgets/custom_deaths_card.dart';

class CustomDeathsList extends StatelessWidget {
  const CustomDeathsList({super.key, required this.allDeathsModel});

  final AllDeathsModel allDeathsModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allDeathsModel.allDeaths!.length,
      itemBuilder: (context, index){
        var model = allDeathsModel.allDeaths![index];
        return CustomDeathsCard(
          id: model.id ?? 0,
          fullName: model.name ?? "",
          fatherName: model.fatherName ?? "",
          motherName: model.momName ?? "",
          nationalID: model.nationalId ?? "",
          city: model.city ?? "",
          birthDate: model.birthDate ?? "",
          deathDate: model.deathDate ?? "",
          deathHour: model.deathHour ?? "",
          reasonOfDeath: model.reasonOfDeath ?? "",
        );
      },
    );
  }
}
