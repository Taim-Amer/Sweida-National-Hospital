import 'package:hospital_management_system/features/EQStoreKeeper/models/AllEqModel.dart';
import 'package:hospital_management_system/features/EQStoreKeeper/models/DeleteEqModel.dart';
import 'package:hospital_management_system/features/EQStoreKeeper/models/ShowEqModel.dart';
import 'package:hospital_management_system/features/EQStoreKeeper/models/StoreEqModel.dart';
import 'package:hospital_management_system/features/EQStoreKeeper/models/UpdateEqModel.dart';

class EqStoreKeeperState {

}

class EqStoreKeeperInitState extends EqStoreKeeperState {}

////// Get All Eq ///////

class GetAllEqLoadingState extends EqStoreKeeperState {}

class GetAllEqSuccessState extends EqStoreKeeperState {
  final AllEqModel allEqModel;
  GetAllEqSuccessState(this.allEqModel);
}

class GetAllEqFailureState extends EqStoreKeeperState {
  final String error;
  GetAllEqFailureState(this.error);
}

/////// Delete Eq ///////

class DeleteEqLoadingState extends EqStoreKeeperState {}

class DeleteEqSuccessState extends EqStoreKeeperState {
  final DeleteEqModel deleteEqModel;
  DeleteEqSuccessState(this.deleteEqModel);
}

class DeleteEqFailureState extends EqStoreKeeperState {
  final String error;
  DeleteEqFailureState(this.error);
}

////// Show Eq ///////

class ShowEqLoadingState extends EqStoreKeeperState {}

class ShowEqSuccessState extends EqStoreKeeperState {
  final ShowEqModel showEqModel;
  ShowEqSuccessState(this.showEqModel);
}

class ShowEqFailureState extends EqStoreKeeperState {
  final String error;
  ShowEqFailureState(this.error);
}

////// Store Eq /////

class StoreEqLoadingState extends EqStoreKeeperState {}

class StoreEqSuccessState extends EqStoreKeeperState {
  final StoreEqModel storeEqModel;
  StoreEqSuccessState(this.storeEqModel);
}

class StoreEqFailureState extends EqStoreKeeperState {
  final String error;
  StoreEqFailureState(this.error);
}

///// Update Eq /////
class UpdateEqLoadingState extends EqStoreKeeperState {}

class UpdateEqSuccessState extends EqStoreKeeperState {
  final UpdateEqModel updateEqModel;
  UpdateEqSuccessState(this.updateEqModel);
}

class UpdateEqFailureState extends EqStoreKeeperState {
  final String error;
  UpdateEqFailureState(this.error);
}
