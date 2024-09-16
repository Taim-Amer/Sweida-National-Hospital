import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/login/views/login_screen.dart';
import 'package:hospital_management_system/features/logout/cubit/logout_cubit.dart';

class CustomLogoutButton extends StatelessWidget {
  const CustomLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(),
      child: BlocConsumer<LogoutCubit, LogoutState>(
        listener: (context, state){
          if(state is LogoutSuccessState) {
            navigateWithFadeAndFinish(context, const LoginScreen());
          }
        },
        builder: (context, state){
          var cubit = LogoutCubit.get(context);
          return Container(
            height: 50,
            decoration: BoxDecoration(
              color: defaultLightColor,
              boxShadow: [
                BoxShadow(
                  color: defaultLightColor.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: MaterialButton(
              onPressed: () => cubit.logout(),
              splashColor: Colors.transparent,
              child: const ListTile(
                leading: Icon(Icons.logout, color: thirdColor),
                title: Text(
                  "الخروج",
                  style: TextStyle(
                    fontSize:  18,
                    color: thirdColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
