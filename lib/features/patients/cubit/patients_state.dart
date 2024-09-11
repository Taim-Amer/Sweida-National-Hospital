part of 'patients_cubit.dart';

abstract class PatientsState {}

class PatientsInitial extends PatientsState {}

// Add Patients
class AddPatientLoadingState extends PatientsState{}
class AddPatientSuccessState extends PatientsState{
  final AddPatientModel addPatientModel;
  AddPatientSuccessState(this.addPatientModel);
}
class AddPatientFailureState extends PatientsState{
  final String error;
  AddPatientFailureState(this.error);
}

// Patient File
class PatientFileLoadingState extends PatientsState{}
class PatientFileSuccessState extends PatientsState{
  final PatientFileModel patientFileModel;
  PatientFileSuccessState(this.patientFileModel);
}
class PatientFileFailureState extends PatientsState{
  final String error;
  PatientFileFailureState(this.error);
}

// Em Transfer
class EmergencyTransferLoadingState extends PatientsState{}
class EmergencyTransferSuccessState extends PatientsState{
  final EmergencyTransferModel emergencyTransferModel;
  EmergencyTransferSuccessState(this.emergencyTransferModel);
}
class EmergencyTransferFailureState extends PatientsState{
  final String error;
  EmergencyTransferFailureState(this.error);
}

// Regular Transfer
class RegularTransferLoadingState extends PatientsState{}
class RegularTransferSuccessState extends PatientsState{
  final RegularTransferModel regularTransferModel;
  RegularTransferSuccessState(this.regularTransferModel);
}
class RegularTransferFailureState extends PatientsState{
  final String error;
  RegularTransferFailureState(this.error);
}



