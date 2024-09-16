import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/surgery/models/add_emergency_surgery_model.dart';
import 'package:hospital_management_system/features/surgery/models/add_regular_surgery_model.dart';
import 'package:hospital_management_system/features/surgery/models/all_emergency_surgery_model.dart';
import 'package:hospital_management_system/features/surgery/models/all_regular_surgery_model.dart';

part 'surgery_state.dart';

class SurgeryCubit extends Cubit<SurgeryState> {
  SurgeryCubit() : super(SurgeryInitial());

  static SurgeryCubit get(context) => BlocProvider.of(context);
  String token = CacheHelper.getData(key: "token");

  AddRegularSurgeryModel? addRegularSurgeryModel;
  void addRegularSurgery({required int patientID}){
    emit(AddRegularSurgeryLoadingState());
    DioHelper.postData(
      endpoint: ADD_SURGERY,
      token: token,
      data: {
        "patient_id" : patientID
      }
    ).then((value){
      addRegularSurgeryModel = AddRegularSurgeryModel.fromJson(value);
      emit(AddRegularSurgerySuccessState(addRegularSurgeryModel!));
    }).catchError((onError){
      emit(AddRegularSurgeryFailureState(onError.toString()));
    });
  }

  AddEmergencySurgeryModel? addEmergencySurgeryModel;
  void addEmergencySurgery({required int patientID}){
    emit(AddEmergencySurgeryLoadingState());
    DioHelper.postData(
      endpoint: ADD_EMERGENCY_SURGERY,
      token: token,
      data: {
          "patient_id" : patientID
      },
    ).then((value){
      addEmergencySurgeryModel = AddEmergencySurgeryModel.fromJson(value);
      emit(AddEmergencySurgerySuccessState(addEmergencySurgeryModel!));
    }).catchError((onError){
      emit(AddEmergencySurgeryFailureState(onError.toString()));
    });
  }

  AllEmergencySurgeryModel? allEmergencySurgeryModel;
  void allEmergencySurgery(){
    emit(state.copyWith(isLoadingEmergencySurgery: true));
    DioHelper.getData(
      endpoint: ALL_EMERGENCY_SURGERY,
      token: token,
    ).then((value){
      allEmergencySurgeryModel = AllEmergencySurgeryModel.fromJson(value);
      emit(state.copyWith(
        allEmergencySurgeryModel: allEmergencySurgeryModel,
        isLoadingEmergencySurgery: false
      ));
    }).catchError((onError){
      emit(state.copyWith(
        error: onError.toString(),
        isLoadingEmergencySurgery: false
      ));
    });
  }

  AllRegularSurgeryModel? allRegularSurgeryModel;
  void allRegularSurgery(){
    emit(state.copyWith(isLoadingRegularSurgery: true));
    DioHelper.getData(
      endpoint: ALL_SURGERY,
      token: token
    ).then((value){
      allRegularSurgeryModel = AllRegularSurgeryModel.fromJson(value);
      emit(state.copyWith(
        allRegularSurgeryModel: allRegularSurgeryModel,
        isLoadingRegularSurgery: false
      ));
    }).catchError((onError){
      emit(state.copyWith(
        error: onError.toString(),
        isLoadingRegularSurgery: false,
      ));
    });
  }
}
