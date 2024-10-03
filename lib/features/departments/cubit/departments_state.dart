part of 'departments_cubit.dart';

class DepartmentsState {
  final AllPatientInDepartmentModel? allPatientInDepartmentModel;
  final AllEmergencyPatientModel? allEmergencyPatientModel;
  final SpecificDepartmentModel? specificDepartmentModel;
  final bool isLoadingEmergencyPatient;
  final bool isLoadingDepartmentPatient;
  final bool isLoadingSpecificDepartment;
  final String? error;

  DepartmentsState({
    this.allPatientInDepartmentModel,
    this.allEmergencyPatientModel,
    this.specificDepartmentModel,
    this.isLoadingEmergencyPatient = false,
    this.isLoadingDepartmentPatient = false,
    this.isLoadingSpecificDepartment = false,
    this.error,
  });

  DepartmentsState copyWith({
    AllPatientInDepartmentModel? allPatientInDepartmentModel,
    AllEmergencyPatientModel? allEmergencyPatientModel,
    bool? isLoadingEmergencyPatient,
    bool? isLoadingDepartmentPatient,
    String? error,
  }) {
    return DepartmentsState(
      allPatientInDepartmentModel: allPatientInDepartmentModel ?? this.allPatientInDepartmentModel,
      allEmergencyPatientModel: allEmergencyPatientModel ?? this.allEmergencyPatientModel,
      isLoadingEmergencyPatient: isLoadingEmergencyPatient ?? this.isLoadingEmergencyPatient,
      isLoadingDepartmentPatient: isLoadingDepartmentPatient ?? this.isLoadingDepartmentPatient,
      error: error ?? this.error,
    );
  }
}

class DepartmentsInitial extends DepartmentsState {}

//Get all departments
class AllDepartmentsLoadingState extends DepartmentsState {}
class AllDepartmentsSuccessState extends DepartmentsState {
  final AllDepartmentModel getAllDepartmentModel;
  AllDepartmentsSuccessState(this.getAllDepartmentModel);
}
class AllDepartmentsFailureState extends DepartmentsState {
  final String error;
  AllDepartmentsFailureState(this.error);
}

//Get specific department
class SpecificDepartmentLoadingState extends DepartmentsState {}
class SpecificDepartmentSuccessState extends DepartmentsState {
  final SpecificDepartmentModel specificDepartmentModel;
  SpecificDepartmentSuccessState(this.specificDepartmentModel);
}
class SpecificDepartmentFailureState extends DepartmentsState {
  final String error;
  SpecificDepartmentFailureState(this.error);
}

// //All patients in specific department
// class AllPatientInDepartmentLoadingState extends DepartmentsState {}
// class AllPatientInDepartmentSuccessState extends DepartmentsState {
//   final AllPatientInDepartmentModel allPatientInDepartmentModel;
//   AllPatientInDepartmentSuccessState(this.allPatientInDepartmentModel);
// }
// class AllPatientInDepartmentFailureState extends DepartmentsState {
//   final String error;
//   AllPatientInDepartmentFailureState(this.error);
// }

//Accept Resident
class AcceptResidentLoadingState extends DepartmentsState {}
class AcceptResidentSuccessState extends DepartmentsState {
  final AcceptResidentModel acceptResidentModel;
  AcceptResidentSuccessState(this.acceptResidentModel);
}
class AcceptResidentFailureState extends DepartmentsState {
  final String error;
  AcceptResidentFailureState(this.error);
}

//Get Resident
class GetResidentLoadingState extends DepartmentsState {}
class GetResidentSuccessState extends DepartmentsState {
  final GetResidentModel getResidentModel;
  GetResidentSuccessState(this.getResidentModel);
}
class GetResidentFailureState extends DepartmentsState {
  final String error;
  GetResidentFailureState(this.error);
}

//Emergency transferring patient (List)
class EmergencyTransferringLoadingState extends DepartmentsState {}
class EmergencyTransferringSuccessState extends DepartmentsState {
  final EmergencyTransferringPatientModel emergencyTransferringPatientModel;
  EmergencyTransferringSuccessState(this.emergencyTransferringPatientModel);
}
class EmergencyTransferringFailureState extends DepartmentsState {
  final String error;
  EmergencyTransferringFailureState(this.error);
}

class GetOutRegularLoadingState extends DepartmentsState {}
class GetOutRegularSuccessState extends DepartmentsState {

}
class GetOutRegularFailureState extends DepartmentsState {
  final String error;
  GetOutRegularFailureState(this.error);
}
class GetOutEmergencyLoadingState extends DepartmentsState {}
class GetOutEmergencySuccessState extends DepartmentsState {

}
class GetOutEmergencyFailureState extends DepartmentsState {
  final String error;
  GetOutEmergencyFailureState(this.error);
}


// //All Emergency Patient
// class AllEmergencyPatientLoadingState extends DepartmentsState {}
// class AllEmergencyPatientSuccessState extends DepartmentsState {
//   final AllEmergencyPatientModel allEmergencyPatientModel;
//   AllEmergencyPatientSuccessState(this.allEmergencyPatientModel);
// }
// class AllEmergencyPatientFailureState extends DepartmentsState {
//   final String error;
//   AllEmergencyPatientFailureState(this.error);
// }









