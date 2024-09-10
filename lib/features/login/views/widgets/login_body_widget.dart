import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_text_field.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/login/manager/cubit/login_cubit.dart';
import 'package:hospital_management_system/features/login/manager/password_visibility_cubit/password_visibility_cubit.dart';
import 'package:iconsax/iconsax.dart';

class LoginBodyWidget extends StatelessWidget {
  LoginBodyWidget({super.key});

  static TextEditingController departmentController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        titleText("نظام ادارة مشفى"),
        const SizedBox(height: Sizes.spaceBtwSections),
        CustomTextField(
          controller: departmentController,
          type: TextInputType.number,
          validator: (value) {},
          label: "رقم القسم",
          suffix: Iconsax.code,
        ),
        const SizedBox(height: Sizes.spaceBtwSections),
        BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
          builder: (context, state){
            return CustomTextField(
              controller: passwordController,
              type: TextInputType.text,
              validator: (value){},
              label: "كلمة المرور",
              prefix: PasswordVisibilityCubit.get(context).suffix,
              isPassword: PasswordVisibilityCubit.get(context).isPassword,
              suffix: Iconsax.lock,
              prefixPressed: (){PasswordVisibilityCubit.get(context).changePasswordVisibility();},
            );
          },
        ),
        const SizedBox(height: Sizes.spaceBtwSections),
        Center(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if(state is LoginSuccessState){
                  navigateWithFadeAndFinish(context, DrawerLayout());
                }
              },
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
                    text: "تسجيل الدخول",
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}