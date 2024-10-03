import 'package:flutter/material.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/model/all_equipments_model.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/views/widgets/custom_equipment_store_keeper_card.dart';

class CustomEquipmentStoreKeeperList extends StatelessWidget {
  const CustomEquipmentStoreKeeperList({super.key, required this.allEquipmentsModel});

  final AllEquipmentsModel allEquipmentsModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allEquipmentsModel.allEquipment!.length,
      itemBuilder: (context, index){
        var model = allEquipmentsModel.allEquipment![index];
        return CustomEquipmentStoreKeeperCard(
          id: model.id ?? 0,
          name: model.name ?? "",
          quantity: model.quantity.toString() ?? "",
          description: model.description ?? "",
        );
      },
    );
  }
}
