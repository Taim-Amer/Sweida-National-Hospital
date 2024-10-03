import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/model/all_equipments_model.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/model/show_equipments_model.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/model/store_equipments_model.dart';

part 'equipment_store_keeper_state.dart';

class EquipmentStoreKeeperCubit extends Cubit<EquipmentStoreKeeperState> {
  EquipmentStoreKeeperCubit() : super(EquipmentStoreKeeperInitial());

  static EquipmentStoreKeeperCubit get(context) => BlocProvider.of(context);
  String token = CacheHelper.getData(key: "token");

  AllEquipmentsModel? allEquipmentsModel;
  void allEquipments() {
    emit(AllEquipmentsLoadingState());
    DioHelper.getData(endpoint: ALL_EQ, token: token).then((value) {
      allEquipmentsModel = AllEquipmentsModel.fromJson(value);
      emit(AllEquipmentsSuccessState(allEquipmentsModel!));
    }).catchError((onError) {
      emit(AllEquipmentsFailureState(onError.toString()));
    });
  }

  StoreEquipmentsModel? storeEquipmentsModel;
  void storeEquipments({
    required String name,
    required String description,
    required String quantity,
  }){
    emit(StoreEquipmentsLoadingState());
    DioHelper.postData(
      endpoint: STORE_EQ,
      token: token,
      data: {
        "name": name,
        "description": description,
        "quantity": quantity
      }
    ).then((value){
      storeEquipmentsModel = StoreEquipmentsModel.fromJson(value);
      emit(StoreEquipmentsSuccessState(storeEquipmentsModel!));
    }).catchError((onError){
      print(onError.toString());
      emit(StoreEquipmentsFailureState(onError.toString()));
    });
  }

  ShowEquipmentsModel? showEquipmentsModel;
  void showEquipments({required int id}){
    emit(ShowEquipmentsLoadingState());
    DioHelper.getData(
      endpoint: SHOW_EQ,
      token: token,
      queryParameters: {
        "id" : id
      }
    ).then((value){
      showEquipmentsModel = ShowEquipmentsModel.fromJson(value);
      emit(ShowEquipmentsSuccessState(showEquipmentsModel!));
    }).catchError((onError){
      emit(ShowEquipmentsFailureState(onError.toString()));
    });
  }

  void updateEquipments({
    required int id,
    String? name,
    String? description,
    String? quantity,
  }){
    emit(UpdateEquipmentsLoadingState());
    DioHelper.postData(
      endpoint: UPDATE_EQ,
      token: token,
      data: {
        "id" : id,
        "name": name,
        "description": description,
        "quantity": quantity
      }
    ).then((value){
      emit(UpdateEquipmentsSuccessState());
    }).catchError((onError){
      emit(UpdateEquipmentsFailureState(onError.toString()));
    });
  }

  void deleteEquipments({required int id}){
    emit(DeleteEquipmentsLoadingState());
    DioHelper.postData(
      endpoint: DELETE_EQ,
      token: token,
      data: {
        "id" : id,
      }
    ).then((value){
      allEquipments();
    }).catchError((onError){
      print(onError.toString());
      emit(DeleteEquipmentsFailureState(onError.toString()));
    });
  }
}
