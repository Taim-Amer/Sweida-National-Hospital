
import 'package:hospital_management_system/features/medstorekeeper/models/RecourceUpdateModel.dart';
import 'package:hospital_management_system/features/medstorekeeper/models/ShowRecourceByIdModel.dart';
import 'package:hospital_management_system/features/medstorekeeper/models/StoreRecourceModel.dart';

import '../models/RecourceDeleteModel.dart';
import '../models/allresourcesmodel.dart';

class medstorekeeperState{
// public final
}


class medstotrekeeperinitstate extends medstorekeeperState {}

        //////// get all recources api /////////
class Get_all_resourcesLoadingState extends medstorekeeperState  {}

class Get_all_resourcesSuccessState extends medstorekeeperState {
  final allresourcesmodel getallresources;
  Get_all_resourcesSuccessState( this.getallresources);
}
class Get_all_resourcesFailureState extends medstorekeeperState{
  final String error;
  Get_all_resourcesFailureState(this.error);
}

      /////// Store resource api //////

class StoreRecourceLoadingState extends medstorekeeperState{}

class StoreRecourceSuccessState extends medstorekeeperState{
  final StoreRecourceModel storeRecourceModel;
  StoreRecourceSuccessState(this.storeRecourceModel);
}
class StoreRecourceFailureState extends medstorekeeperState{
  final String error;
  StoreRecourceFailureState(this.error);
}


      ////// Show a recource By Id ///////

class ShowRecourceByIdLoadingState extends medstorekeeperState {}

class ShowRecourceByIdSuccessState extends medstorekeeperState {
  final ShowRecourceByIdModel showRecourceByIdModel;
  ShowRecourceByIdSuccessState(this.showRecourceByIdModel);
}

class ShowRecourceByIdFailureState extends medstorekeeperState {
  final String error;
  ShowRecourceByIdFailureState(this.error);
}

      ////// Update Recource by id /////

class RecourceUpdateLoadingState extends medstorekeeperState {}

class RecourceUpdateSuccessState extends medstorekeeperState {
  final RecourceUpdateModel recourceUpdateModel ;
  RecourceUpdateSuccessState(this.recourceUpdateModel);
}

class RecourceUpdateFailureState extends medstorekeeperState {
  final String error ;
  RecourceUpdateFailureState(this.error);
}

      ///// Delete Recource by id //////
class RecourceDeleteLoadingState extends medstorekeeperState {}

class RecourceDeleteSuccessState extends medstorekeeperState {
  final RecourceDeleteModel recourceDeleteModel ;
  RecourceDeleteSuccessState(this.recourceDeleteModel);
}

class RecourceDeleteFailureState extends medstorekeeperState {
  final String error ;
  RecourceDeleteFailureState(this.error);
}
