import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/medical_store_keeper/model/all_resources_model.dart';
import 'package:hospital_management_system/features/medical_store_keeper/model/delete_resourses_model.dart';
import 'package:hospital_management_system/features/medical_store_keeper/model/show_resources_model.dart';
import 'package:hospital_management_system/features/medical_store_keeper/model/store_resources_model.dart';
import 'package:hospital_management_system/features/medical_store_keeper/model/update_resourses_model.dart';

part 'medical_store_keeper_state.dart';

class MedicalStoreKeeperCubit extends Cubit<MedicalStoreKeeperState> {
  MedicalStoreKeeperCubit() : super(MedicalStoreKeeperInitial());

  static MedicalStoreKeeperCubit get(context) => BlocProvider.of(context);
  String token = CacheHelper.getData(key: "token");

  AllResoursesModel? allResoursesModel;
  void allResources(){
    emit(AllResourcesLoadingState());
    DioHelper.getData(
      endpoint: ALL_RECOURCES,
      token: token,
    ).then((value){
      allResoursesModel = AllResoursesModel.fromJson(value);
      emit(AllResourcesSuccessState(allResoursesModel!));
    }).catchError((onError){
      emit(AllResourcesFailureState(onError.toString()));
    });
  }

  StoreResoursesModel? storeResoursesModel;
  void storeResources({
    required String name,
    required String endDate,
    required String company,
    required int quantity,
    required int availabilityStatus
  }){
    emit(StoreResourcesLoadingState());
    DioHelper.postData(
      endpoint: STORE_RECOURCES,
      token: token,
      data: {
        "name" : name,
        "end_date" : endDate,
        "company" : company,
        "quantity" : quantity,
        "availability_status" : availabilityStatus
      }
    ).then((value){
      storeResoursesModel = StoreResoursesModel.fromJson(value);
      emit(StoreResourcesSuccessState(storeResoursesModel!));
    }).catchError((onError){
      emit(StoreResourcesFailureState(onError.toString()));
    });
  }

  ShowResourcesModel? showResourcesModel;
  void showResources({required int id}){
    emit(ShowResourcesLoadingState());
    DioHelper.getData(
      endpoint: SHOW_RECOURCE_BY_ID,
      token: token,
      queryParameters: {
        "id" : id
      }
    ).then((value){
      showResourcesModel = ShowResourcesModel.fromJson(value);
      emit(ShowResourcesSuccessState(showResourcesModel!));
    }).catchError((onError){
      emit(ShowResourcesFailureState(onError.toString()));
    });
  }

  UpdateResoursesModel? updateResoursesModel;
  void updateResources({
    required String name,
    required String quantity,
    required String availabilityStatus,
  }){
    emit(UpdateResourcesLoadingState());
    DioHelper.postData(
      endpoint: RECOURCE_UPDATE,
      token: token,
      data: {
        "name" : name,
        "quantity" : quantity,
        "availability_status" : availabilityStatus
      }
    ).then((value){
      updateResoursesModel = UpdateResoursesModel.fromJson(value);
      emit(UpdateResourcesSuccessState(updateResoursesModel!));
    }).catchError((onError){
      emit(UpdateResourcesFailureState(onError.toString()));
    });
  }

  DeleteResoursesModel? deleteResoursesModel;
  void deleteResources({required int id}){
    emit(DeleteResourcesLoadingState());
    DioHelper.deleteData(
        endpoint: RECOURCE_DELETE,
      token: token,
      queryParameters: {
          "id" : id
      }
    ).then((value){
      deleteResoursesModel = DeleteResoursesModel.fromJson(value);
      emit(DeleteResourcesSuccessState(deleteResoursesModel!));
    }).catchError((onError){
      emit(DeleteResourcesFailureState(onError.toString()));
    });
  }
}
