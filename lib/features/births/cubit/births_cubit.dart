import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/births/model/all_births_model.dart';
import 'package:hospital_management_system/features/births/model/birth_by_date_model.dart';
import 'package:hospital_management_system/features/births/model/update_birth_model.dart';

part 'births_state.dart';

class BirthsCubit extends Cubit<BirthsState> {
  BirthsCubit() : super(BirthsInitial());

  static BirthsCubit get(context) => BlocProvider.of(context);
  String token = CacheHelper.getData(key: "token");

  AllBirthsModel? allBirthsModel;
  void allBirths() {
    emit(AllBirthsLoadingState());
    DioHelper.getData(
      endpoint: ALL_BIRTHS,
      token: token,
    ).then((value) {
      allBirthsModel = AllBirthsModel.fromJson(value);
      emit(AllBirthsSuccessState(allBirthsModel!));
    }).catchError((onError) {
      emit(AllBirthsFailureState(onError.toString()));
    });
  }

  BirthByDateModel? birthByDateModel;
  void birthByDate({required String date}) {
    emit(BirthByDateLoadingState());
    DioHelper.getData(
        endpoint: BIRTH_BY_DATE,
        token: token,
        queryParameters: {
          "date": date,
        }
    ).then((value) {
      // birthByDateModel = BirthByDateModel.fromJson(value);
      emit(BirthByDateSuccessState(birthByDateModel!));
    }).catchError((onError) {
      emit(BirthByDateFailureState(onError.toString()));
    });
  }

  void storeBirth({
    required String name,
    required String fatherName,
    required String motherName,
    required String birthDate,
    required String city,
    required String nationalID,
  }){
    emit(StoreBirthLaodingState());
    DioHelper.postData(
      endpoint: STORE_BIRTH,
      token: token,
      data: {
        "name" : name,
        "father_name" : fatherName,
        "mother_name" : motherName,
        "birth_date" : birthDate,
        "city" : city,
        "national_id" : nationalID
      }
    ).then((value){
      emit(StoreBirthSuccessState());
    }).catchError((onError){
      emit(StoreBirthFailureState(onError.toString()));
    });
  }


  UpdateBirthModel? updateBirthModel;
  void updateBirth({
    required int id,
    String? name,
    String? fatherName,
    String? motherName,
    String? birthDate,
    String? city,
    String? nationalID,
  }){
    emit(UpdateBirthLaodingState());
    DioHelper.postData(
      endpoint: UPDATE_BIRTH,
      token: token,
      data: {
        "id" : id,
        "name" : name,
        "father_name" : fatherName,
        "mother_name" : motherName,
        "birth_date" : birthDate,
        "city" : city,
        "national_id" : nationalID
      }
    ).then((value){
      updateBirthModel = UpdateBirthModel.fromJson(value);
      emit(UpdateBirthSuccessState(updateBirthModel!));
    }).catchError((onError){
      print(onError.toString());
      print(onError.toString());
      print(onError.toString());
      emit(UpdateBirthFailureState(onError.toString()));
    });
  }

  void deleteBirth({required int id}){
    emit(DeleteBirthLaodingState());
    DioHelper.postData(
      endpoint: DELETE_BIRTH,
      token: token,
      data: {
          "id" : id
      },
    ).then((value){
      emit(DeleteBirthSuccessState());
    }).catchError((onError){
      emit(DeleteBirthFailureState(onError.toString()));
    });
  }
}
