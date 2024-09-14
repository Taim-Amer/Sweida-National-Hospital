import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/tests/models/all_emergency_tests_model.dart';
import 'package:hospital_management_system/features/tests/models/all_emergency_xray_model.dart';
import 'package:hospital_management_system/features/tests/models/all_regular_tests_model.dart';
import 'package:hospital_management_system/features/tests/models/all_regular_xray_model.dart';
import 'package:hospital_management_system/features/tests/models/emergency_test_request_model.dart';
import 'package:hospital_management_system/features/tests/models/emergency_xray_request_model.dart';
import 'package:hospital_management_system/features/tests/models/get_emergency_test_model.dart';
import 'package:hospital_management_system/features/tests/models/get_emergency_xray_model.dart';
import 'package:hospital_management_system/features/tests/models/get_regular_test_model.dart';
import 'package:hospital_management_system/features/tests/models/get_regular_xray_model.dart';
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
      emit(RegularXRayRequestSuccessState(regularXrayRequestModel!));
    }).catchError((onError){
      emit(RegularXRayRequestFailureState(onError.toString()));
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
      emit(EmergencyXRayRequestSuccessState(emergencyXrayRequestModel!));
    }).catchError((onError){
      emit(EmergencyXRayRequestFailureState(onError.toString()));
    });
  }

  AllEmergencyTestsModel? allEmergencyTestsModel;
  void allEmergencyTestPatients(){
    emit(AllEmergencyTestLoadingState());
    DioHelper.getData(
      endpoint: ALL_EMERGENCY_TEST,
      token: token
    ).then((value){
      allEmergencyTestsModel = AllEmergencyTestsModel.fromJson(value);
      emit(AllEmergencyTestSuccessState(allEmergencyTestsModel!));
    }).catchError((onError){
      emit(AllEmergencyTestFailureState(onError.toString()));
    });
  }

  AllEmergencyXrayModel? allEmergencyXrayModel;
  void allEmergencyXrayPatients(){
    emit(AllEmergencyXrayLoadingState());
    DioHelper.getData(
      endpoint: ALL_EMERGENCY_XRAY,
      token: token,
    ).then((value){
      allEmergencyXrayModel = AllEmergencyXrayModel.fromJson(value);
      emit(AllEmergencyXraySuccessState(allEmergencyXrayModel!));
    }).catchError((onError){
      emit(AllEmergencyTestFailureState(onError.toString()));
    });
  }

  AllRegularTestsModel? allRegularTestsModel;
  void allRegularTestPatients(){
    emit(AllRegularTestLoadingState());
    DioHelper.getData(
        endpoint: ALL_REGULAR_TEST,
        token: token
    ).then((value){
      allRegularTestsModel = AllRegularTestsModel.fromJson(value);
      emit(AllRegularTestSuccessState(allRegularTestsModel!));
    }).catchError((onError){
      emit(AllRegularTestFailureState(onError.toString()));
    });
  }

  AllRegularXrayModel? allRegularXrayModel;
  void allRegularXrayPatients(){
    emit(AllRegularXrayLoadingState());
    DioHelper.getData(
      endpoint: ALL_REGULAR_XRAY,
      token: token,
    ).then((value){
      allRegularXrayModel = AllRegularXrayModel.fromJson(value);
      emit(AllRegularXraySuccessState(allRegularXrayModel!));
    }).catchError((onError){
      emit(AllRegularTestFailureState(onError.toString()));
    });
  }

  GetEmergencyTestModel? getEmergencyTestModel;
  void getEmergencyTest({required int patientID}){
    emit(GetEmergencyTestLoadingState());
    DioHelper.postData(
      endpoint: GET_EMERGENCY_TEST,
      token: token,
      data: {
        "patient_id" : patientID
      }
    ).then((value){
      getEmergencyTestModel = GetEmergencyTestModel.fromJson(value);
      emit(GetEmergencyTestSuccessState(getEmergencyTestModel!));
    }).catchError((onError){
      emit(GetEmergencyTestFailureState(onError.toString()));
    });
  }

  GetEmergencyXrayModel? getEmergencyXrayModel;
  void getEmergencyXray({required int patientID}){
    emit(GetEmergencyXrayLoadingState());
    DioHelper.postData(
      endpoint: GET_EMERGENCY_XRAY,
      token: token,
      data: {
        "patient_id" : patientID
      }
    ).then((value){
      getEmergencyXrayModel = GetEmergencyXrayModel.fromJson(value);
      emit(GetEmergencyXraySuccessState(getEmergencyXrayModel!));
    }).catchError((onError){
      emit(GetEmergencyXrayFailureState(onError.toString()));
    });
  }

  GetRegularTestModel? getRegularTestModel;
  void getRegularTest({required int patientID}){
    emit(GetRegularTestLoadingState());
    DioHelper.postData(
      endpoint: GET_REGULAR_TEST,
      token: token,
      data: {
        "patient_id" : patientID
      }
    ).then((value){
      getRegularTestModel = GetRegularTestModel.fromJson(value);
      emit(GetRegularTestSuccessState(getRegularTestModel!));
    }).catchError((onError){
      emit(GetRegularTestFailureState(onError.toString()));
    });
  }

  GetRegularXrayModel? getRegularXrayModel;
  void getRegularXray({required int patientID}){
    emit(GetRegularXrayLoadingState());
    DioHelper.postData(
      endpoint: GET_REGULAR_XRAY,
      token: token,
      data: {
          "patient_id" : patientID
      },
    ).then((value){
      getRegularXrayModel = GetRegularXrayModel.fromJson(value);
      emit(GetRegularXraySuccessState(getRegularXrayModel!));
    }).catchError((onError){
      emit(GetRegularXrayFailureState(onError.toString()));
    });
  }
}
