part of 'password_visibility_cubit.dart';

@immutable
abstract class PasswordVisibilityState {}

class PasswordVisibilityInitial extends PasswordVisibilityState {}

class ChangePasswordVisibilityState extends PasswordVisibilityState {}
