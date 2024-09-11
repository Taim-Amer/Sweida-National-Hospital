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
  Future<void> getSpecificDepartment({required int id})async{
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
  }) {
    emit(AcceptResidentLoadingState());
    DioHelper.postData(
      endpoint: ACCEPT_RESIDENT,
      token: token,
      data: {
        "patient_id": patientId,
      },
    ).then((value) {
      acceptResidentModel = AcceptResidentModel.fromJson(value);

      emit(AcceptResidentSuccessState(acceptResidentModel!));
    }).catchError((onError) {
      emit(AcceptResidentFailureState(onError.toString()));
    });
  }

  AllPatientInDepartmentModel? allPatientInDepartmentModel;
  Future<void> getAllPatientInDepartment({required int departmentId}) async {
    emit(state.copyWith(isLoadingDepartmentPatient: true));
    DioHelper.postData(
      endpoint: ALL_PATIENT_IN_DEPARTMENT,
      token: token,
      data: {"department_id": departmentId},
    ).then((value) {
      AllPatientInDepartmentModel departmentModel = AllPatientInDepartmentModel.fromJson(value);
      emit(state.copyWith(
        allPatientInDepartmentModel: departmentModel,
        isLoadingDepartmentPatient: false,
      ));
    }).catchError((onError) {
      emit(state.copyWith(
        error: onError.toString(),
        isLoadingDepartmentPatient: false,
      ));
    });
  }

  GetResidentModel? getResidentModel;

  void getResidents({
    required int departmentId
  }) {
    emit(GetResidentLoadingState());
    DioHelper.postData(
      endpoint: GET_RESIDENT,
      token: token,
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
      token: token,
    ).then((value) {
      //============================================
    }).catchError((onError) {
      emit(EmergencyTransferringFailureState(onError.toString()));
    });
  }

  AllEmergencyPatientModel? allEmergencyPatientModel;
  Future<void> getAllEmergencyPatient() async {
    emit(state.copyWith(isLoadingEmergencyPatient: true));
    DioHelper.getData(
      endpoint: ALL_EMERGENCY_PATIENT,
      token: token,
    ).then((value) {
      AllEmergencyPatientModel emergencyModel = AllEmergencyPatientModel.fromJson(value);
      emit(state.copyWith(
        allEmergencyPatientModel: emergencyModel,
        isLoadingEmergencyPatient: false,
      ));
    }).catchError((onError) {
      emit(state.copyWith(
        error: onError.toString(),
        isLoadingEmergencyPatient: false,
      ));
    });
  }
}
