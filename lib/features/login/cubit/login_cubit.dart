import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/end_points.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/login/model/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;
  void login({
    required int departmentId,
    required String password,
  }){
    emit(LoginLoadingState());
    DioHelper.postData(
        endpoint: LOGIN,
        data: {
          "department_id" : departmentId,
          "password" : password,
        },
    ).then((value){
      loginModel = LoginModel.fromJson(value);
      print(loginModel!.message);
      print(loginModel!.message);
      print(loginModel!.message);
      print(loginModel!.message);

      emit(LoginSuccessState(loginModel!));
    }).catchError((onError){

      print(onError.toString());
      print(onError.toString());
      print(onError.toString());
      print(onError.toString());

      emit(LoginFailureState(onError.toString()));
    });
  }
}
