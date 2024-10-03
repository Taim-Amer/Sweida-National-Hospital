import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/human_resources/model/absent_lefting_leave_model.dart';
import 'package:hospital_management_system/features/human_resources/model/absent_penalty_model.dart';
import 'package:hospital_management_system/features/human_resources/model/add_employee_model.dart';
import 'package:hospital_management_system/features/human_resources/model/all_absent_in_date_model.dart';
import 'package:hospital_management_system/features/human_resources/model/all_attendance_in_date_model.dart';
import 'package:hospital_management_system/features/human_resources/model/all_employee_model.dart';
import 'package:hospital_management_system/features/human_resources/model/all_penalty_in_date_model.dart';
import 'package:hospital_management_system/features/human_resources/model/delete_employee_model.dart';
import 'package:hospital_management_system/features/human_resources/model/establish_atterndance_model.dart';
import 'package:hospital_management_system/features/human_resources/model/show_employee_model.dart';
import 'package:hospital_management_system/features/human_resources/model/update_absent_model.dart';
import 'package:hospital_management_system/features/human_resources/model/update_attendance_model.dart';
import 'package:hospital_management_system/features/human_resources/model/update_employee_model.dart';

part 'human_resources_state.dart';

class HumanResourcesCubit extends Cubit<HumanResourcesState> {
  HumanResourcesCubit() : super(HumanResourcesInitial());

  static HumanResourcesCubit get(context) => BlocProvider.of(context);
  String token = CacheHelper.getData(key: "token");

  EstablishAttendanceModel? establishAttendanceModel;

  void establishAttendance({required int employeeID, required String date}) {
    emit(EstablishAttendanceLoadingState());
    DioHelper.postData(
        endpoint: ESTABLISH_ATTENDANCE,
        token: token,
        data: {"emp_id": employeeID, "date": date}).then((value) {
      establishAttendanceModel = EstablishAttendanceModel.fromJson(value);
      emit(EstablishAttendanceSuccessState(establishAttendanceModel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(EstablishAttendanceFailureState(onError.toString()));
    });
  }

  void absentLeave({required int employeeID, required String date}) {
    emit(AbsentLeftingLeaveLoadingState());
    DioHelper.postData(
        endpoint: LEFTING_LEAVE,
        token: token,
        data: {"emp_id": employeeID, "date": date}).then((value) {
      emit(AbsentLeftingLeaveSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AbsentLeftingLeaveFailureState(onError.toString()));
    });
  }

  void absentPenalty({required int employeeID, required String date}) {
    emit(AbsentPenaltyLoadingState());
    DioHelper.postData(endpoint: ABSENT_PENALTY, token: token, data: {
      "emp_id": employeeID,
      "date": date,
    }).then((value) {
      emit(AbsentPenaltySuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AbsentPenaltyFailureState(onError.toString()));
    });
  }

  UpdateAttendanceModel? updateAttendanceModel;

  void updateAttendance({required int attendanceID, required String date}) {
    emit(UpdateAttendanceLoadingState());
    DioHelper.postData(endpoint: UPDATE_ATTENDANCE, token: token, data: {
      "attendance_id": attendanceID,
      "date": date,
    }).then((value) {
      // updateAttendanceModel = UpdateAttendanceModel.fromJson(value);
      emit(UpdateAttendanceSuccessState(updateAttendanceModel!));
    }).catchError((onError) {
      emit(UpdateAttendanceFailureState(onError.toString()));
    });
  }

  UpdateAbsentModel? updateAbsentModel;

  void updateAbsent({required int attendanceID,
    required String date,
    required String vaction}) {
    emit(UpdateAbsentLoadingState());
    DioHelper.postData(endpoint: UPDATE_ABSENT, token: token, data: {
      "attendance_id": attendanceID,
      "date": date,
      "vaction": vaction
    }).then((value) {
      // updateAbsentModel = UpdateAbsentModel.fromJson(value);
      emit(UpdateAbsentSuccessState(updateAbsentModel!));
    }).catchError((onError) {
      emit(UpdateAbsentFailureState(onError.toString()));
    });
  }

  AllAttendanceInDateModel? allAttendanceInDateModel;

  void allAttendanceInDate() {
    emit(AllAttendanceInDateLoadingState());
    DioHelper.postData(
        endpoint: ALL_ATTENDANCE_IN_DATE,
        token: token).then((value) {
      allAttendanceInDateModel = AllAttendanceInDateModel.fromJson(value);
      emit(AllAttendanceInDateSuccessState(allAttendanceInDateModel!));
    }).catchError((onError) {
      emit(AllAttendanceInDateFailureState(onError.toString()));
    });
  }

  AllAbsentInDateModel? allAbsentInDateModel;

  void allAbsentInDate() {
    emit(AllAbsentInDateLoadingState());
    DioHelper.postData(
        endpoint: ALL_ABSENT_IN_DATE,
        token: token).then((value) {
      allAbsentInDateModel = AllAbsentInDateModel.fromJson(value);
      emit(AllAbsentInDateSuccessState(allAbsentInDateModel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(AllAbsentInDateFailureState(onError.toString()));
    });
  }

  AllPenaltyInDateModel? allPenaltyInDateModel;

  void allPenaltyInDate() {
    emit(AllPenaltyInDateLoadingState());
    DioHelper.postData(
      endpoint: ALL_PENALTY_IN_DATE,
      token: token,
    ).then((value) {
      allPenaltyInDateModel = AllPenaltyInDateModel.fromJson(value);
      emit(AllPenaltyInDateSuccessState(allPenaltyInDateModel!));
    }).catchError((onError) {
      emit(AllPenaltyInDateFailureState(onError.toString()));
    });
  }

  // AddEmployeeModel? addEmployeeModel;

  void addEmployee({required String name, required String departmantID, required String rule}) {
    emit(AddEmployeeLoadingState());
    DioHelper.postData(
        endpoint: ADD_EMP,
        token: token,
        data: {
          "name": name,
          "department_id": departmantID,
          "rule" : rule
        }).then((value) {
      emit(AddEmployeeSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AddEmployeeFailureState(onError.toString()));
    });
  }

  ShowEmployeeModel? showEmployeeModel;

  void showEmployee({required int employeeID}) {
    emit(ShowEmployeeLoadingState());
    DioHelper.postData(
        endpoint: SHOW_EMP,
        token: token,
        data: {"emp_id": employeeID}).then((value) {
      // showEmployeeModel = ShowEmployeeModel.fromJson(value);
      emit(ShowEmployeeSuccessState(showEmployeeModel!));
    }).catchError((onError) {
      emit(ShowEmployeeFailureState(onError.toString()));
    });
  }

  UpdateEmployeeModel? updateEmployeeModel;

  void updateEmployee({required int employeeID,
    required String name,
    required int departmentID}) {
    emit(UpdateEmployeeLoadingState());
    DioHelper.postData(endpoint: UPDATE_EMP, token: token, data: {
      "emp_id": employeeID,
      "name": name,
      "department_id": departmentID
    }).then((value) {
      // updateEmployeeModel = UpdateEmployeeModel.fromJson(value);
      emit(UpdateEmployeeSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(UpdateEmployeeFailureState(onError.toString()));
    });
  }

  DeleteEmployeeModel? deleteEmployeeModel;

  void deleteEmployee({required int employeeID}) {
    emit(DeleteEmployeeLoadingState());
    DioHelper.postData(
        endpoint: DELETE_EMP,
        token: token,
        data: {"emp_id": employeeID}).then((value) {
      deleteEmployeeModel = DeleteEmployeeModel.fromJson(value);
      emit(DeleteEmployeeSuccessState(deleteEmployeeModel!));
    }).catchError((onError) {
      emit(DeleteEmployeeFailureState(onError.toString()));
    });
  }

  AllEmployeeModel? allEmployeeModel;

  void allEmployee() {
    emit(AllEmployeeLoadingState());
    DioHelper.getData(
      endpoint: ALL_EMP,
      token: token,
    ).then((value){
      allEmployeeModel = AllEmployeeModel.fromJson(value);
      emit(AllEmployeeSuccessState(allEmployeeModel!));
    }).catchError((onError){
      emit(AllEmployeeFailureState(onError.toString()));
    });
  }
}
