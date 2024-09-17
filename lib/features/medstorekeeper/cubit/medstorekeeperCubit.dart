import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/medstorekeeper/cubit/medstorekeeperState.dart';
import 'package:hospital_management_system/features/medstorekeeper/models/RecourceUpdateModel.dart';
import 'package:hospital_management_system/features/medstorekeeper/models/ShowRecourceByIdModel.dart';
import 'package:hospital_management_system/features/medstorekeeper/models/StoreRecourceModel.dart';
import 'package:hospital_management_system/features/medstorekeeper/models/allresourcesmodel.dart';

import '../../../core/network/local/cache_helper.dart';
import '../models/RecourceDeleteModel.dart';

class MedstorekeeperCubit extends Cubit<medstorekeeperState>{
  MedstorekeeperCubit() : super(medstotrekeeperinitstate());
  
  static MedstorekeeperCubit get(context) => BlocProvider.of(context);
  String token = CacheHelper.getData(key: "token");
  
  allresourcesmodel? Allresourcesmodel;
  
  void getallresources(){

    emit(Get_all_resourcesLoadingState());

    DioHelper.getData(endpoint: ALL_RECOURCES,).then((value){

      Allresourcesmodel =allresourcesmodel.fromJson(value);

      emit(Get_all_resourcesSuccessState(Allresourcesmodel!));

    }).catchError((onError){

      emit(Get_all_resourcesFailureState(onError.toString()));

    });
  }

StoreRecourceModel? storeRecourceModel;
void storeresource({
    required String name,
    required String end_date,
    required String company,
    required int quantity,
    required int availability_status
}){
    emit(StoreRecourceLoadingState());
    DioHelper.postData(endpoint: STORE_RECOURCES,
    data: {
      "name" : name,
      "end_date" : end_date,
      "company" : company,
      "quantity" : quantity,
      "availability_status" : availability_status
    }).then((value){
      storeRecourceModel = StoreRecourceModel.fromJson(value);
      emit(StoreRecourceSuccessState(storeRecourceModel!));

    }).catchError((Error){
      emit(StoreRecourceFailureState(Error.toString()));
    });
}


  ShowRecourceByIdModel? showRecourceByIdModel;
  void showrecourcebyid({
    required int id
  }){
    emit(ShowRecourceByIdLoadingState());
    DioHelper.getData(endpoint: SHOW_RECOURCE_BY_ID,
    queryParameters: {
      "id" : id,
    }).then((value){
      showRecourceByIdModel = ShowRecourceByIdModel.fromJson(value);
      emit(ShowRecourceByIdSuccessState(showRecourceByIdModel!));
    }).catchError((error){
      emit(ShowRecourceByIdFailureState(error.toString()));
    });
  }

  RecourceUpdateModel? recourceUpdateModel;
  void recourcupdate({
    required int id,
    required String name,
    required String quantity,
    required int availability_status,
  }){
    emit(RecourceUpdateLoadingState());
    DioHelper.postData(endpoint: RECOURCE_UPDATE,
    data : {
      "name" : name,
      "quantity" : quantity,
      "availability_status" : availability_status,
      "id" : id
    }).then((value){
      recourceUpdateModel = RecourceUpdateModel.fromJson(value);
      emit(RecourceUpdateSuccessState(recourceUpdateModel!));
    }).catchError((error){
      emit(RecourceUpdateFailureState(error.toString()));
    });
  }

  RecourceDeleteModel? recourceDeleteModel;
  void recourcedelete({
    required int id,
  }){
    emit(RecourceDeleteLoadingState());
    DioHelper.postData(endpoint: RECOURCE_DELETE,
        data : {
          "id" : id
        }).then((value){
      recourceDeleteModel = RecourceDeleteModel.fromJson(value);
      emit(RecourceDeleteSuccessState(recourceDeleteModel!));
    }).catchError((error){
      emit(RecourceDeleteFailureState(error.toString()));
    });
  }

}