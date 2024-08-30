import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/logout/model/logout_model.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  static LogoutCubit get(context) => BlocProvider.of(context);

  LogoutModel? logoutModel;
  void logout({
    required String token
  }){
    emit(LogoutLoadingState());
    DioHelper.postData(
        endpoint: LOGOUT,
        data: {
          "token" : token
        }
    ).then((value){
      logoutModel = LogoutModel.fromJson(value);

      print(logoutModel!.message);
      print(logoutModel!.message);
      print(logoutModel!.message);
      print(logoutModel!.message);

      emit(LogoutSuccessState(logoutModel!));
    }).catchError((onError){
      emit(LogoutFailureState(onError.toString()));

      print(onError.toString());
      print(onError.toString());
      print(onError.toString());

    });
  }

}
