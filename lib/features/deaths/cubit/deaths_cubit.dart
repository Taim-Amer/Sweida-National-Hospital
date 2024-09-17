import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/deaths/model/all_deaths_model.dart';
import 'package:hospital_management_system/features/deaths/model/death_by_date_model.dart';
import 'package:hospital_management_system/features/deaths/model/delete_death_model.dart';
import 'package:hospital_management_system/features/deaths/model/store_death_model.dart';
import 'package:hospital_management_system/features/deaths/model/update_death_model.dart';

part 'deaths_state.dart';

class DeathsCubit extends Cubit<DeathsState> {
  DeathsCubit() : super(DeathsInitial());

  static DeathsCubit get(context) => BlocProvider.of(context);
  String token = CacheHelper.getData(key: "token");

  AllDeathsModel? allDeathsModel;
  void allDeaths(){
    emit(AllDeathsLoadingState());
    DioHelper.getData(
      endpoint: ALL_DEATHS,
      token: token
    ).then((value){
      allDeathsModel = AllDeathsModel.fromJson(value);
      emit(AllDeathsSuccessState(allDeathsModel!));
    }).catchError((onError){
      emit(AllDeathsFailureState(onError.toString()));
    });
  }

  DeathByDateModel? deathByDateModel;
  void deathsById({required String date}){
    emit(DeathByDateLoadingState());
    DioHelper.postData(
      endpoint: DEATH_BY_DATE,
      token: token,
      data: {
        "date" : date
      }
    ).then((value){
      deathByDateModel = DeathByDateModel.fromJson(value);
      emit(DeathByDateSuccessState(deathByDateModel!));
    }).catchError((onError){
      emit(DeathByDateFailureState(onError.toString()));
    });
  }

  StoreDeathModel? storeDeathModel;
  void storeDeath({
    required String name,
    required String fatherName,
    required String motherName,
    required String birthDate,
    required String city,
    required int nationalId,
    required String deathDate,
    required String hourDate,
    required String reasonOfDeath,
  }){
    emit(StoreDeathLaodingState());
    DioHelper.postData(
      endpoint: STORE_DEATH,
      token: token,
      data: {
        "name" : name,
        "father_name" : fatherName,
        "mom_name" : motherName,
        "birth_date" : fatherName,
        "city" : city,
        "National_id" : nationalId,
        "death_date" : deathDate,
        "death_hour" : hourDate,
        "reason_of_death" : reasonOfDeath
      }
    ).then((value){
      storeDeathModel = StoreDeathModel.fromJson(value);
      emit(StoreDeathSuccessState(storeDeathModel!));
    }).catchError((onError){
      emit(StoreDeathFailureState(onError.toString()));
    });
  }

  UpdateDeathModel? updateDeathModel;
  void updateDeath({required String name , required int id}){
    emit(UpdateDeathLaodingState());
    DioHelper.postData(
      endpoint: UPDATE_DEATH,
      token: token,
      data: {
        "id" : id,
        "name" : name
      }
    ).then((value){
      // updateDeathModel = UpdateDeathModel.fromJson(value);
      emit(UpdateDeathSuccessState(updateDeathModel!));
    }).catchError((onError){
      emit(UpdateDeathFailureState(onError.toString()));
    });
  }

  DeleteDeathModel? deleteDeathModel;
  void deleteDeath({required int id}){
    emit(DeleteDeathLaodingState());
    DioHelper.deleteData(
      endpoint: DELETE_DEATH,
      token: token,
      queryParameters: {
        "id" : id
      }
    ).then((value){
      // deleteDeathModel = DeleteDeathModel.fromJson(value);
      emit(DeleteDeathSuccessState(deleteDeathModel!));
    }).catchError((onError){
      emit(DeleteDeathFailureState(onError.toString()));
    });
  }
}
