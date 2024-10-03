import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_divider.dart';
import 'package:hospital_management_system/features/births/views/widgets/custom_births_button.dart';
import 'package:hospital_management_system/features/departments/cubit/departments_cubit.dart';
import 'package:hospital_management_system/features/drawer/cubit/drawer_cubit.dart';
import 'package:hospital_management_system/features/drawer/views/widgets/custom_add_birth_button.dart';
import 'package:hospital_management_system/features/drawer/views/widgets/custom_add_emloyee_button.dart';
import 'package:hospital_management_system/features/drawer/views/widgets/custom_add_equipment_button.dart';
import 'package:hospital_management_system/features/drawer/views/widgets/custom_add_medical_button.dart';
import 'package:hospital_management_system/features/drawer/views/widgets/custom_all_attendance_button.dart';
import 'package:hospital_management_system/features/drawer/views/widgets/custom_all_leave_button.dart';
import 'package:hospital_management_system/features/drawer/views/widgets/custom_all_penalty_button.dart';
import 'package:hospital_management_system/features/drawer/views/widgets/custom_department_name_container.dart';
import 'package:hospital_management_system/features/drawer/views/widgets/custom_drawer_menu_item.dart';
import 'package:hospital_management_system/features/deaths/views/widgets/cutom_deaths_button.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/cubit/equipment_store_keeper_cubit.dart';
import 'package:hospital_management_system/features/human_resources/cubit/human_resources_cubit.dart';
import 'package:hospital_management_system/features/human_resources/views/widgets/custom_employee_button.dart';
import 'package:hospital_management_system/features/login/views/widgets/login_body_widget.dart';
import 'package:hospital_management_system/features/logout/views/custom_logout_button.dart';
import 'package:hospital_management_system/features/medical_store_keeper/cubit/medical_store_keeper_cubit.dart';
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
        BlocProvider(create: (context) => HumanResourcesCubit()),
        BlocProvider(create: (context) => DepartmentsCubit()..getSpecificDepartment(id: departmentID!)),
        BlocProvider(
          create: (context) => MedicalStoreKeeperCubit()..allResources(),
        ),
        BlocProvider(
          create: (context) => EquipmentStoreKeeperCubit()..allEquipments(),
        ),
      ],
      child: BlocBuilder<DrawerCubit, DrawerState>(
        builder: (context, state) {
          var cubit = DrawerCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Row(
              children: [
                Expanded(flex: 6000, child: Container(child: cubit.screens[cubit.selectedIndex!])),
                Expanded(flex: 2 ,child: Container(color: const Color(0xff0c1321))),
                Expanded(
                  flex: 1000,
                  child: Container(
                    color: screenBackgroundColor,
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
                          departmentID == 1 ? const CustomAddEmloyeeButton() : const SizedBox(),
                          departmentID == 1 ?  const SizedBox(height: Sizes.spaceBtwItems) : const SizedBox(),
                          departmentID == 1 ? const CustomAddBirthButton() : const SizedBox(),
                          departmentID == 1 ?  const SizedBox(height: Sizes.spaceBtwItems) : const SizedBox(),
                          departmentID == 1 ? const CustomDeathsButton() : const SizedBox(),
                          departmentID == 1 ?  const SizedBox(height: Sizes.spaceBtwItems) : const SizedBox(),
                          departmentID == 1 ? const CustomBirthsButton() : const SizedBox(),
                          departmentID == 1 ?  const SizedBox(height: Sizes.spaceBtwItems) : const SizedBox(),
                          departmentID == 1 ? const CustomAllLeaveButton() : const SizedBox(),
                          departmentID == 1 ?  const SizedBox(height: Sizes.spaceBtwItems) : const SizedBox(),
                          departmentID == 1 ? const CustomAllPenaltyButton() : const SizedBox(),
                          departmentID == 1 ?  const SizedBox(height: Sizes.spaceBtwItems) : const SizedBox(),
                          departmentID == 1 ? const CustomAllAttendanceButton() : const SizedBox(),
                          departmentID == 9 ? const CustomAddMedicalButton() : const SizedBox(),
                          departmentID == 9 ?  const SizedBox(height: Sizes.spaceBtwItems) : const SizedBox(),
                          departmentID == 9 ? const CustomAddEquipmentButton() : const SizedBox(),
                          // departmentID == 9 ?  const SizedBox(height: Sizes.spaceBtwItems) : const SizedBox(),
                          // departmentID == 9 ? const CustomMedicalStoreButton() : const SizedBox(),
                          // departmentID == 9 ?  const SizedBox(height: Sizes.spaceBtwItems) : const SizedBox(),
                          // departmentID == 9 ? const CustomEquipmentStoreButton() : const SizedBox(),
                          departmentID == 1 ?  const SizedBox(height: Sizes.spaceBtwItems) : const SizedBox(),
                          departmentID == 1 ? const CustomEmployeeButton() : const SizedBox(),
                          const CustomDividerItem(),
                          departmentID != 1 ? const CustomDrawerMenuItem(index: 0, icon: Icons.view_day_outlined, title: "المرضى") : const SizedBox(),
                          departmentID == 10 ? const CustomDrawerMenuItem(index: 1, icon: Icons.view_day_outlined, title: "الجراحة") : const SizedBox(),
                          // departmentID == 1 ? const CustomDrawerMenuItem(index: 2, icon: Icons.view_day_outlined, title: "الوفيات") : const SizedBox(),
                          // departmentID == 1 ? const CustomDrawerMenuItem(index: 3, icon: Icons.view_day_outlined, title: "الولادات") : const SizedBox(),
                          // const CustomDrawerMenuItem(index: 4, icon: Icons.view_day_outlined, title: "المستودع"),
                          const CustomDividerItem(),
                          const SizedBox(height: Sizes.spaceBtwItems),
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