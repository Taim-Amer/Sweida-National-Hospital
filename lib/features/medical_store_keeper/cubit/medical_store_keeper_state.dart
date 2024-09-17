part of 'medical_store_keeper_cubit.dart';

abstract class MedicalStoreKeeperState {}

class MedicalStoreKeeperInitial extends MedicalStoreKeeperState {}

class AllResourcesLoadingState extends MedicalStoreKeeperState {}
class AllResourcesSuccessState extends MedicalStoreKeeperState {
  final AllResoursesModel allResoursesModel;
  AllResourcesSuccessState(this.allResoursesModel);
}
class AllResourcesFailureState extends MedicalStoreKeeperState {
  final String error;
  AllResourcesFailureState(this.error);
}

class StoreResourcesLoadingState extends MedicalStoreKeeperState {}
class StoreResourcesSuccessState extends MedicalStoreKeeperState {
  final StoreResoursesModel storeRecourceModel;
  StoreResourcesSuccessState(this.storeRecourceModel);
}
class StoreResourcesFailureState extends MedicalStoreKeeperState {
  final String error;
  StoreResourcesFailureState(this.error);
}

class ShowResourcesLoadingState extends MedicalStoreKeeperState {}
class ShowResourcesSuccessState extends MedicalStoreKeeperState {
  final ShowResourcesModel showResoursesModel;
  ShowResourcesSuccessState(this.showResoursesModel);
}
class ShowResourcesFailureState extends MedicalStoreKeeperState {
  final String error;
  ShowResourcesFailureState(this.error);
}

class UpdateResourcesLoadingState extends MedicalStoreKeeperState {}
class UpdateResourcesSuccessState extends MedicalStoreKeeperState {
  final UpdateResoursesModel updateResoursesModel;
  UpdateResourcesSuccessState(this.updateResoursesModel);
}
class UpdateResourcesFailureState extends MedicalStoreKeeperState {
  final String error;
  UpdateResourcesFailureState(this.error);
}

class DeleteResourcesLoadingState extends MedicalStoreKeeperState {}
class DeleteResourcesSuccessState extends MedicalStoreKeeperState {
  final DeleteResoursesModel deleteResoursesModel;
  DeleteResourcesSuccessState(this.deleteResoursesModel);
}
class DeleteResourcesFailureState extends MedicalStoreKeeperState {
  final String error;
  DeleteResourcesFailureState(this.error);
}
