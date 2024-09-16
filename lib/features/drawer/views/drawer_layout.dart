import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_divider.dart';
import 'package:hospital_management_system/features/departments/cubit/departments_cubit.dart';
import 'package:hospital_management_system/features/drawer/cubit/drawer_cubit.dart';
import 'package:hospital_management_system/features/drawer/views/widgets/custom_add_surgery_button.dart';
import 'package:hospital_management_system/features/drawer/views/widgets/custom_department_name_container.dart';
import 'package:hospital_management_system/features/drawer/views/widgets/custom_drawer_menu_item.dart';
import 'package:hospital_management_system/features/login/views/widgets/login_body_widget.dart';
import 'package:hospital_management_system/features/logout/views/custom_logout_button.dart';
import 'package:hospital_management_system/features/surgery/cubit/surgery_cubit.dart';
import 'package:hospital_management_system/features/tests/cubit/tests_cubit.dart';
import 'package:hospital_management_system/features/tests/views/widgets/custom_emergency_tests_queue_button.dart';
import 'package:hospital_management_system/features/tests/views/widgets/custom_emergency_xray_queue_button.dart';
import 'package:hospital_management_system/features/tests/views/widgets/custom_regular_tests_queue_button.dart';
import 'package:hospital_management_system/features/tests/views/widgets/custom_regular_xray_queue_button.dart';

import 'widgets/custom_add_patient_button.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    int? departmentID = int.tryParse(LoginBodyWidget.departmentController.text);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DrawerCubit()),
        BlocProvider(create: (context) => TestsCubit()),
        BlocProvider(create: (context) => SurgeryCubit()),
        BlocProvider(create: (context) => DepartmentsCubit()..getSpecificDepartment(id: departmentID!)),
      ],
      child: BlocBuilder<DrawerCubit, DrawerState>(
        builder: (context, state) {
          var cubit = DrawerCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Row(
              children: [
                Expanded(flex: 6, child: Container(child: cubit.screens[cubit.selectedIndex!])),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(Sizes.defaultSpace),
                      child: ListView(
                        children: [
                          const CustomDepartmentNameContainer(),
                          const SizedBox(height: Sizes.spaceBtwSections),
                          departmentID == 2 ? CustomAddPatientButton() : const SizedBox(),
                          // const SizedBox(height: Sizes.spaceBtwSections),
                          // CustomAddSurgeryButton(),
                          // const SizedBox(height: Sizes.spaceBtwItems),
                          if(departmentID == 4) const CustomEmergencyXrayQueueButton()
                          else if(departmentID == 5) const CustomRegularXrayQueueButton()
                          else if(departmentID == 6) const CustomEmergencyTestsQueueButton()
                            else if(departmentID == 7) const CustomRegularTestsQueueButton(),
                          const CustomDividerItem(),
                          const CustomDrawerMenuItem(index: 0, icon: Icons.view_day_outlined, title: "المرضى"),
                          departmentID == 16 ? const CustomDrawerMenuItem(index: 1, icon: Icons.view_day_outlined, title: "الجراحة") : const SizedBox(),
                          const CustomDrawerMenuItem(index: 2, icon: Icons.view_day_outlined, title: "الوفيات"),
                          const CustomDrawerMenuItem(index: 3, icon: Icons.view_day_outlined, title: "الولادات"),
                          const CustomDrawerMenuItem(index: 4, icon: Icons.view_day_outlined, title: "المستودع"),
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
