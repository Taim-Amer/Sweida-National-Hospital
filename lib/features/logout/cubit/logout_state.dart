part of 'logout_cubit.dart';

abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoadingState extends LogoutState {}

class LogoutSuccessState extends LogoutState {
  final LogoutModel logoutModel;
  LogoutSuccessState(this.logoutModel);
}

class LogoutFailureState extends LogoutState {
  final String error;
  LogoutFailureState(this.error);
}
