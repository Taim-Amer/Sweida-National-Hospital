
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/EQStoreKeeper/cubit/EqStoreKeeperState.dart';
import 'package:hospital_management_system/features/EQStoreKeeper/models/AllEqModel.dart';
import 'package:hospital_management_system/features/EQStoreKeeper/models/DeleteEqModel.dart';
import 'package:hospital_management_system/features/EQStoreKeeper/models/ShowEqModel.dart';
import 'package:hospital_management_system/features/EQStoreKeeper/models/StoreEqModel.dart';
import 'package:hospital_management_system/features/EQStoreKeeper/models/UpdateEqModel.dart';

import '../../../core/network/local/cache_helper.dart';

class EqStoreKeeperCubit extends Cubit<EqStoreKeeperState>{
  EqStoreKeeperCubit() : super(EqStoreKeeperInitState());

  static EqStoreKeeperCubit get(context) => BlocProvider.of(context);
  String token = CacheHelper.getData(key: "token");

  AllEqModel? allEqModel ;

  void getAllEq(){
    emit(GetAllEqLoadingState());
    DioHelper.getData(endpoint: ALL_EQ).then((value){
      allEqModel = AllEqModel.fromJson(value);
      emit(GetAllEqSuccessState(allEqModel!));
    }).catchError((error){
      emit(GetAllEqFailureState(error.toString()));
    });
  }
  DeleteEqModel? deleteEqModel;

  void deleteEq({
    required int id,
}){
    emit(DeleteEqLoadingState());
    DioHelper.getData(endpoint: DELETE_EQ,
    queryParameters: {
      "id" : id,
    }).then((value){
      deleteEqModel = DeleteEqModel.fromJson(value);
      emit(DeleteEqSuccessState(deleteEqModel!));
    }).catchError((error){
      emit(DeleteEqFailureState(error.toString()));
    });
  }

  ShowEqModel? showEqModel ;

  void showEq({
   required int id
  }){
    emit(ShowEqLoadingState());
    DioHelper.getData(endpoint: SHOW_EQ,
    queryParameters: {
      "id" : id
    }).then((value){
      showEqModel = ShowEqModel.fromJson(value);
      emit(ShowEqSuccessState(showEqModel!));
    }
    ).catchError((error){
      emit(ShowEqFailureState(error.toString()));
    });
  }

  StoreEqModel? storeEqModel;

  void storeEq({
    required String name,
    required String description,
    required int quantity
  }){
    emit(StoreEqLoadingState());
    DioHelper.postData(endpoint: STORE_EQ,
    data : {
      "name" : name,
      "description" : description,
      "quantity" : quantity
    }).then((value){
      storeEqModel = StoreEqModel.fromJson(value);
      emit(StoreEqSuccessState(storeEqModel!));
    }).catchError((error){
      emit(StoreEqFailureState(error.toString()));
    });
  }

  UpdateEqModel? updateEqModel;

  void updateEq({
  required String name,
  required String description,
  required int quantity
  }){
    emit(UpdateEqLoadingState());
    DioHelper.postData(endpoint: UPDATE_EQ,
  data : {
  "name" : name,
  "description" : description,
  "quantity" : quantity
  }).then((value){
    updateEqModel = UpdateEqModel.fromJson(value);
    emit(UpdateEqSuccessState(updateEqModel!));
  }).catchError((error){
    emit(UpdateEqFailureState(error.toString()));
  });
  }
}