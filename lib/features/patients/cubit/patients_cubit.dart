import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/patients/models/add_patient_model.dart';
import 'package:hospital_management_system/features/patients/models/emergency_transfer_model.dart';
import 'package:hospital_management_system/features/patients/models/patient_file_model.dart';

part 'patients_state.dart';

class PatientsCubit extends Cubit<PatientsState> {
  PatientsCubit() : super(PatientsInitial());

  String token = CacheHelper.getData(key: "token");
  static PatientsCubit get(context) => BlocProvider.of(context);

  AddPatientModel? addPatientModel;
  void addPatient({
    required String fullName,
    required String address,
    required String dateOfBirth,
    required String motherName,
    required int chain,
    required String gender,
    required String caseDescriptions,
    required String treatmentRequired,
  }){
    emit(AddPatientLoadingState());
    DioHelper.postData(
      endpoint: ADD_PATIENT,
      token: token,
      data: {
        "full_name" : fullName,
        "address" : address,
        "date_of_birth" : dateOfBirth,
        "mom_name" : motherName,
        "chain" : chain,
        "gender" : gender,
        "case_description" : caseDescriptions,
        "treatment_required" : treatmentRequired
      }
    ).then((value){
      addPatientModel = AddPatientModel.fromJson(value);
      print(addPatientModel!.message);
      print(addPatientModel!.message);
      print(addPatientModel!.message);
      print(addPatientModel!.message);

      emit(AddPatientSuccessState(addPatientModel!));
    }).catchError((onError){
      emit(AddPatientFailureState(onError.toString()));
    });
  }

  PatientFileModel? patientFileModel;
  void getPatientFile({required int patientID}){
    emit(PatientFileLoadingState());
    DioHelper.postData(
      endpoint: PATIENT_FILE,
      token: token,
      data: {
        "patient_id" : patientID
      },
    ).then((value){
      patientFileModel = PatientFileModel.fromJson(value);

      print(patientFileModel!.data!.other!.departmentId);
      print(patientFileModel!.data!.other!.departmentId);
      print(patientFileModel!.data!.other!.departmentId);
      print(patientFileModel!.data!.other!.departmentId);

      emit(PatientFileSuccessState(patientFileModel!));
    }).catchError((onError){
      emit(PatientFileFailureState(onError.toString()));
      print(onError.toString());
      print(onError.toString());
      print(onError.toString());
      print(onError.toString());
    });
  }

  EmergencyTransferModel? emergencyTransferModel;
  void emTransfer({
    required int patientID,
    required int targetDepartmentID
  }){
    emit(EmergencyTransferLoadingState());
    DioHelper.postData(
      endpoint: EM_TRANSFER,
      token: token,
      data: {
        "patient_id" : patientID,
        "tr_department" : targetDepartmentID
      }
    ).then((value){
      emergencyTransferModel = EmergencyTransferModel.fromJson(value);
      print(emergencyTransferModel!.message);
      print(emergencyTransferModel!.message);
      print(emergencyTransferModel!.message);

      emit(EmergencyTransferSuccessState(emergencyTransferModel!));
    }).catchError((onError){
      emit(EmergencyTransferFailureState(onError.toString()));
    });
  }
}
