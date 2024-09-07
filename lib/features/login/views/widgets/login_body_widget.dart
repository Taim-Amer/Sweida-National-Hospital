import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_text_field.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/login/manager/cubit/login_cubit.dart';
import 'package:hospital_management_system/features/login/manager/password_visibility_cubit/password_visibility_cubit.dart';
import 'package:iconsax/iconsax.dart';

class LoginBodyWidget extends StatelessWidget {
  LoginBodyWidget({super.key});

  TextEditingController departmentController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText("Hospital Management System"),
        const SizedBox(height: Sizes.spaceBtwSections),
        CustomTextField(
          controller: departmentController,
          type: TextInputType.number,
          validator: (value) {},
          label: "Department ID",
          prefix: Iconsax.code,
        ),
        const SizedBox(height: Sizes.spaceBtwSections),
        BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
          builder: (context, state){
            return CustomTextField(
              controller: passwordController,
              type: TextInputType.text,
              validator: (value){},
              label: "Password",
              prefix: Iconsax.lock,
              isPassword: PasswordVisibilityCubit.get(context).isPassword,
              suffix: PasswordVisibilityCubit.get(context).suffix,
              suffixPressed: (){PasswordVisibilityCubit.get(context).changePasswordVisibility();},
            );
          },
        ),
        const SizedBox(height: Sizes.spaceBtwSections),
        Center(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state){
                return CustomButton(
                    function: (){
                      int? departmentID = int.tryParse(departmentController.text);
                      if(departmentID != null && passwordController.text.isNotEmpty){
                        LoginCubit.get(context).login(
                          departmentId: departmentID,
                          password: passwordController.text,
                        );
                      }else {
                        showToast("Please check your input data", ToastState.WARNING);
                      }
                    },
                    text: "LOGIN",
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}