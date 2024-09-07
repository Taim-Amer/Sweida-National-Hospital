import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

part 'password_visibility_state.dart';

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  PasswordVisibilityCubit() : super(PasswordVisibilityInitial());

  static PasswordVisibilityCubit get(context) => BlocProvider.of(context);

  IconData suffix = Iconsax.eye_slash;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Iconsax.eye_slash : Iconsax.eye;
    emit(ChangePasswordVisibilityState());
  }
}
