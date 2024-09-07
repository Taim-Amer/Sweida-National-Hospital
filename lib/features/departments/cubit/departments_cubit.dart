import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/departments/models/accept_resident_model.dart';
import 'package:hospital_management_system/features/departments/models/all_department_model.dart';
import 'package:hospital_management_system/features/departments/models/all_emergency_patient_model.dart';
import 'package:hospital_management_system/features/departments/models/all_patient_in_department_model.dart';
import 'package:hospital_management_system/features/departments/models/emergency_transferring_model.dart';
import 'package:hospital_management_system/features/departments/models/get_resident_model.dart';
import 'package:hospital_management_system/features/departments/models/specific_department_model.dart';

part 'departments_state.dart';

class DepartmentsCubit extends Cubit<DepartmentsState> {
  DepartmentsCubit() : super(DepartmentsInitial());

  static DepartmentsCubit get(context) => BlocProvider.of(context);
  String token = CacheHelper.getData(key: "token");

  AllDepartmentModel? allDepartmentModel;
  void getAllDepartments() {
    emit(AllDepartmentsLoadingState());
    DioHelper.getData(
      endpoint: ALL_DEPARTMENTS,
    ).then((value) {
      allDepartmentModel = AllDepartmentModel.fromJson(value);

      print(allDepartmentModel!.allDepartments!.first.name);
      print(allDepartmentModel!.allDepartments!.first.name);
      print(allDepartmentModel!.allDepartments!.first.name);
      print(allDepartmentModel!.allDepartments!.first.name);

      emit(AllDepartmentsSuccessState(allDepartmentModel!));
    }).catchError((onError) {
      emit(AllDepartmentsFailureState(onError.toString()));

      print(onError.toString());
      print(onError.toString());
      print(onError.toString());
      print(onError.toString());
    });
  }

  SpecificDepartmentModel? specificDepartmentModel;

  void getSpecificDepartment({required int id}) {
    emit(SpecificDepartmentLoadingState());
    DioHelper.postData(
      endpoint: SPECIFIC_DEPARTMENT,
      data: {
        "id": id,
      },
    ).then((value) {
      specificDepartmentModel = SpecificDepartmentModel.fromJson(value);

      print(specificDepartmentModel!.depDetails!.name);
      print(specificDepartmentModel!.depDetails!.name);
      print(specificDepartmentModel!.depDetails!.name);
      print(specificDepartmentModel!.depDetails!.name);

      emit(SpecificDepartmentSuccessState(specificDepartmentModel!));
    }).catchError((onError) {
      print(onError.toString());
      print(onError.toString());
      print(onError.toString());

      emit(SpecificDepartmentFailureState(onError.toString()));
    });
  }

  AcceptResidentModel? acceptResidentModel;

  void acceptResident({
    required int patientId,
    required int departmentId,
  }) {
    emit(AcceptResidentLoadingState());
    DioHelper.postData(
      endpoint: ACCEPT_RESIDENT,
      bearerToken: token,
      data: {
        "patient_id": patientId,
        "department_id": departmentId,
      },
    ).then((value) {
      acceptResidentModel = AcceptResidentModel.fromJson(value);

      print(acceptResidentModel!.messgae);
      print(acceptResidentModel!.messgae);
      print(acceptResidentModel!.messgae);
      print(acceptResidentModel!.messgae);

      emit(AcceptResidentSuccessState(acceptResidentModel!));
    }).catchError((onError) {
      emit(AcceptResidentFailureState(onError.toString()));

      print(onError.toString());
      print(onError.toString());
      print(onError.toString());
      print(onError.toString());
    });
  }

  AllPatientInDepartmentModel? allPatientInDepartmentModel;

  void getAllPatientInDepartment({
    required int departmentId,
  }) {
    emit(AllPatientInDepartmentLoadingState());
    DioHelper.postData(
      endpoint: ALL_PATIENT_IN_DEPARTMENT,
      bearerToken: token,
      data: {
        "department_id": departmentId
      },
    ).then((value) {
      // allPatientInDepartmentModel = AllPatientInDepartmentModel.fromJson(value);
      //====================================================================
    }).catchError((onError) {
      emit(AllPatientInDepartmentFailureState(onError.toString()));
    });
  }

  GetResidentModel? getResidentModel;

  void getResidents({
    required int departmentId
  }) {
    emit(GetResidentLoadingState());
    DioHelper.postData(
      endpoint: GET_RESIDENT,
      bearerToken: token,
      data: {
        "department_id": departmentId
      },
    ).then((value) {
      //=========================================
    }).catchError((onError) {
      emit(GetResidentFailureState(onError.toString()));
    });
  }

  EmergencyTransferringPatientModel? emergencyTransferringPatientModel;
  void getEmergencyTransferringPatient() {
    emit(EmergencyTransferringLoadingState());
    DioHelper.postData(
      endpoint: EMERGENCY_TRANSFERRING_PATIENT,
      bearerToken: token,
    ).then((value) {
      //============================================
    }).catchError((onError) {
      emit(EmergencyTransferringFailureState(onError.toString()));
    });
  }

  AllEmergencyPatientModel? allEmergencyPatientModel;
  void getAllEmergencyPatient(){
    emit(AllEmergencyPatientLoadingState());
    DioHelper.getData(
      endpoint: ALL_EMERGENCY_PATIENT,
      bearerToken: token
    ).then((value){
      allEmergencyPatientModel = AllEmergencyPatientModel.fromJson(value);
      print(allEmergencyPatientModel!.allEmergencyPatient!.first.fullName);
      print(allEmergencyPatientModel!.allEmergencyPatient!.first.fullName);
      print(allEmergencyPatientModel!.allEmergencyPatient!.first.fullName);
      print(allEmergencyPatientModel!.allEmergencyPatient!.first.fullName);

      emit(AllEmergencyPatientSuccessState(allEmergencyPatientModel!));
    }).catchError((onError){
      emit(AllEmergencyPatientFailureState(onError.toString()));
    });
  }

}
