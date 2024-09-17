part of 'equipment_store_keeper_cubit.dart';

abstract class EquipmentStoreKeeperState {}

class EquipmentStoreKeeperInitial extends EquipmentStoreKeeperState {}

class AllEquipmentsLoadingState extends EquipmentStoreKeeperState {}
class AllEquipmentsSuccessState extends EquipmentStoreKeeperState {
  final AllEquipmentsModel allEquipmentsModel;
  AllEquipmentsSuccessState(this.allEquipmentsModel);
}
class AllEquipmentsFailureState extends EquipmentStoreKeeperState {
  final String error;
  AllEquipmentsFailureState(this.error);
}

class StoreEquipmentsLoadingState extends EquipmentStoreKeeperState {}
class StoreEquipmentsSuccessState extends EquipmentStoreKeeperState {
  final StoreEquipmentsModel storeEquipmentsModel;
  StoreEquipmentsSuccessState(this.storeEquipmentsModel);
}
class StoreEquipmentsFailureState extends EquipmentStoreKeeperState {
  final String error;
  StoreEquipmentsFailureState(this.error);
}

class ShowEquipmentsLoadingState extends EquipmentStoreKeeperState {}
class ShowEquipmentsSuccessState extends EquipmentStoreKeeperState {
  final ShowEquipmentsModel showEquipmentsModel;
  ShowEquipmentsSuccessState(this.showEquipmentsModel);
}
class ShowEquipmentsFailureState extends EquipmentStoreKeeperState {
  final String error;
  ShowEquipmentsFailureState(this.error);
}

class UpdateEquipmentsLoadingState extends EquipmentStoreKeeperState {}
class UpdateEquipmentsSuccessState extends EquipmentStoreKeeperState {
  final UpdateEquipmentsModel updateEquipmentsModel;
  UpdateEquipmentsSuccessState(this.updateEquipmentsModel);
}
class UpdateEquipmentsFailureState extends EquipmentStoreKeeperState {
  final String error;
  UpdateEquipmentsFailureState(this.error);
}

class DeleteEquipmentsLoadingState extends EquipmentStoreKeeperState {}
class DeleteEquipmentsSuccessState extends EquipmentStoreKeeperState {
  final DeleteEquipmentsModel deleteEquipmentsModel;
  DeleteEquipmentsSuccessState(this.deleteEquipmentsModel);
}
class DeleteEquipmentsFailureState extends EquipmentStoreKeeperState {
  final String error;
  DeleteEquipmentsFailureState(this.error);
}
