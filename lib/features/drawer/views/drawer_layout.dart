import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_divider.dart';
import 'package:hospital_management_system/features/drawer/cubit/drawer_cubit.dart';
import 'package:hospital_management_system/features/drawer/views/widgets/custom_drawer_menu_item.dart';
import 'package:hospital_management_system/features/login/views/widgets/login_body_widget.dart';
import 'package:hospital_management_system/features/logout/views/custom_logout_button.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/custom_add_patient_button.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerCubit(),
      child: BlocBuilder<DrawerCubit, DrawerState>(
        builder: (context, state){
          int? departmentID = int.tryParse(LoginBodyWidget.departmentController.text);
          var cubit = DrawerCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    child: cubit.screens[cubit.selectedIndex!],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(Sizes.defaultSpace),
                      child: ListView(
                        children:[
                          const SizedBox(
                              height: 200,
                              child: Image(image: AssetImage("assets/images/MoH_Logo-removebg-preview.png"))),
                          const SizedBox(height: Sizes.spaceBtwSections,),
                          departmentID == 2 ? CustomAddPatientButton() : const SizedBox(),
                          const CustomDividerItem(),
                          const CustomDrawerMenuItem(index: 0, icon: Icons.person_outline, title: "المرضى"),
                          const CustomDrawerMenuItem(index: 1, icon: Icons.vaccines_outlined, title: "التحاليل"),
                          const CustomDrawerMenuItem(index: 2, icon: Icons.home, title: "Home"),
                          const CustomDrawerMenuItem(index: 3, icon: Icons.home, title: "Home"),
                          const CustomDrawerMenuItem(index: 4, icon: Icons.home, title: "Home"),
                          const CustomDrawerMenuItem(index: 5, icon: Icons.home, title: "Home"),
                          const CustomDividerItem(),
                          const CustomLogoutButton()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// _buildAnimatedMenuItem(0, Icons.dashboard, 'Dashboard'),
// _buildAnimatedMenuItem(1, Icons.calendar_today, 'Reservations'),
// _buildAnimatedMenuItem(2, Icons.person, 'Patients'),
// _buildAnimatedMenuItem(3, Icons.healing, 'Treatments'),
// _buildAnimatedMenuItem(4, Icons.people, 'Staff List'),
// const Divider(color: silverColor),
// _buildAnimatedMenuItem(5, Icons.report, 'Report'),
