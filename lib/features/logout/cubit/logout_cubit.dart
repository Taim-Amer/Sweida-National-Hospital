import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/logout/models/logout_model.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  static LogoutCubit get(context) => BlocProvider.of(context);
  String? token = CacheHelper.getData(key: "token");

  LogoutModel? logoutModel;
  void logout(){
    emit(LogoutLoadingState());
    DioHelper.postData(
        endpoint: LOGOUT,
        token: token,
    ).then((value){
      logoutModel = LogoutModel.fromJson(value);
      CacheHelper.removeData(key: "token");

      emit(LogoutSuccessState(logoutModel!));
    }).catchError((onError){
      emit(LogoutFailureState(onError.toString()));
    });
  }
}
