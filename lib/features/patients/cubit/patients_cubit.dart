import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/patients/models/add_patient_model.dart';

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
      bearerToken: token,
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
}
