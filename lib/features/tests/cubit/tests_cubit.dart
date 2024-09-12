import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/tests/models/emergency_test_request_model.dart';
import 'package:hospital_management_system/features/tests/models/emergency_xray_request_model.dart';
import 'package:hospital_management_system/features/tests/models/regular_test_request_model.dart';
import 'package:hospital_management_system/features/tests/models/regular_xray_request_model.dart';

part 'tests_state.dart';

class TestsCubit extends Cubit<TestsState> {
  TestsCubit() : super(TestsInitial());
  String token = CacheHelper.getData(key: "token");

  static TestsCubit get(context) => BlocProvider.of(context);

  RegularTestRequestModel? regularTestRequestModel;
  void regularTestRequest({required int patientID}){
    emit(RegularTestRequestLoadingState());
    DioHelper.postData(
      endpoint: TEST_REQUEST,
      data: {
        "patient_id" : patientID
      }
    ).then((value){
      regularTestRequestModel = RegularTestRequestModel.fromJson(value);
      emit(RegularTestRequestSuccessState(regularTestRequestModel!));
    }).catchError((onError){
      emit(RegularTestRequestFailureState(onError.toString()));
    });
  }

  RegularXrayRequestModel? regularXrayRequestModel;
  void regularXrayRequest({required int patientID}){
    emit(RegularXRayRequestLoadingState());
    DioHelper.postData(
      endpoint: XRAY_REQUEST,
      data: {
        "patient_id" : patientID
      }
    ).then((value){
      regularXrayRequestModel = RegularXrayRequestModel.fromJson(value);

      print(regularXrayRequestModel!.message);
      print(regularXrayRequestModel!.message);
      print(regularXrayRequestModel!.message);

      emit(RegularXRayRequestSuccessState(regularXrayRequestModel!));
    }).catchError((onError){
      emit(RegularXRayRequestFailureState(onError.toString()));

      print(onError.toString());
      print(onError.toString());
      print(onError.toString());
    });
  }

  EmergencyTestRequestModel? emergencyTestRequestModel;
  void emergencyTestRequest({required int patientID}){
    emit(EmergencyTestRequestLoadingState());
    DioHelper.postData(
      endpoint: EMERGENCY_TEST_REQUEST,
      data: {
        "patient_id" : patientID
      }
    ).then((value){
      emergencyTestRequestModel = EmergencyTestRequestModel.fromJson(value);
      emit(EmergencyTestRequestSuccessState(emergencyTestRequestModel!));
    }).catchError((onError){
      emit(EmergencyTestRequestFailureState(onError.toString()));
    });
  }

  EmergencyXrayRequestModel? emergencyXrayRequestModel;
  void emergencyXrayRequest({required int patientID}){
    emit(EmergencyXRayRequestLoadingState());
    DioHelper.postData(
      endpoint: EMERGENCY_XRAY_REQUEST,
      data: {
        "patient_id" : patientID
      }
    ).then((value){
      emergencyXrayRequestModel = EmergencyXrayRequestModel.fromJson(value);

      print(emergencyXrayRequestModel!.message);
      print(emergencyXrayRequestModel!.message);
      print(emergencyXrayRequestModel!.message);

      emit(EmergencyXRayRequestSuccessState(emergencyXrayRequestModel!));
    }).catchError((onError){
      emit(EmergencyXRayRequestFailureState(onError.toString()));

      print(onError.toString());
      print(onError.toString());
      print(onError.toString());
    });
  }
}
