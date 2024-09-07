part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}

class LoginFailureState extends LoginState {
  final String error;
  LoginFailureState(this.error);
}
