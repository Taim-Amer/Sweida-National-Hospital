import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/medical_store_keeper/model/all_resources_model.dart';
import 'package:hospital_management_system/features/medical_store_keeper/model/delete_resourses_model.dart';
import 'package:hospital_management_system/features/medical_store_keeper/model/show_resources_model.dart';
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

  void storeResources({
    required String name,
    required String endDate,
    required String company,
    required String quantity,
    int? availabilityStatus = 1
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
      emit(StoreResourcesSuccessState());
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

  void updateResources({
    String? name,
    String? quantity,
    required int id
  }){
    emit(UpdateResourcesLoadingState());
    DioHelper.postData(
      endpoint: RECOURCE_UPDATE,
      token: token,
      data: {
        "name" : name,
        "quantity" : quantity,
        "id" : id
      }
    ).then((value){
      emit(UpdateResourcesSuccessState());
    }).catchError((onError){
      emit(UpdateResourcesFailureState(onError.toString()));
    });
  }

  DeleteResoursesModel? deleteResoursesModel;
  void deleteResources({required int id}){
    emit(DeleteResourcesLoadingState());
    DioHelper.postData(
        endpoint: RECOURCE_DELETE,
      token: token,
      data: {
          "id" : id
      }
    ).then((value){
      allResources();
    }).catchError((onError){
      emit(DeleteResourcesFailureState(onError.toString()));
    });
  }
}
