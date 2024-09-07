import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/features/login/manager/cubit/login_cubit.dart';
import 'package:hospital_management_system/features/login/manager/password_visibility_cubit/password_visibility_cubit.dart';
import 'package:hospital_management_system/features/login/views/widgets/login_body_widget.dart';
import 'package:hospital_management_system/features/login/views/widgets/login_image_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => PasswordVisibilityCubit(),
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              defaultLightColor.withOpacity(0.75),
              Colors.white,
              secondDarkColor.withOpacity(0.3),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              width: 900,
              height: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white.withOpacity(0.85),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 25,
                    spreadRadius: 5,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.defaultSpace),
                      child: LoginBodyWidget(),
                    ),
                  ),
                  const Expanded(
                    child: LoginImageWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

