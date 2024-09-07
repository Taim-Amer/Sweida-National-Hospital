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


