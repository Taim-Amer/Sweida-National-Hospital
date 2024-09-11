import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/features/departments/cubit/departments_cubit.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_patient_list.dart';
import 'package:hospital_management_system/features/login/views/widgets/login_body_widget.dart';

import 'widgets/custom_emergency_patient_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            int? departmentID = int.tryParse(LoginBodyWidget.departmentController.text);
            return DepartmentsCubit()..getAllEmergencyPatient()..getAllPatientInDepartment(departmentId: departmentID!);
          },
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              defaultLightColor.withOpacity(0.75),
              Colors.white,
              secondDarkColor.withOpacity(0.3),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: Sizes.spaceBtwItems),
                          child: Container(
                            width: 520,
                            height: 200,
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: const Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "assets/logos/Screenshot_20240911-174949_Chrome-removebg-preview.png",
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: Sizes.spaceBtwSections),
                Expanded(
                  flex: 6,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: BlocBuilder<DepartmentsCubit, DepartmentsState>(
                          builder: (context, state) {
                            if (state.allEmergencyPatientModel != null) {
                              return CustomEmergencyPatientList(allEmergencyPatientModel: state.allEmergencyPatientModel!);
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                      const SizedBox(width: Sizes.spaceBtwSections),
                      Expanded(
                        flex: 2,
                        child: BlocBuilder<DepartmentsCubit, DepartmentsState>(
                          builder: (context, state){
                            if(state.allPatientInDepartmentModel != null){
                              return CustomRegularPatientList(allPatientInDepartmentModel: state.allPatientInDepartmentModel!);
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// const SizedBox(height: Sizes.spaceBtwSections),
// BlocBuilder<DepartmentsCubit, DepartmentsState>(
//   builder: (context, state){
//     if(state is SpecificDepartmentSuccessState){
//       return CustomSpecificDepartmentCard(specificDepartmentModel: state.specificDepartmentModel,);
//     }else if(state is AllEmergencyPatientLoadingState && state is SpecificDepartmentLoadingState){
//       return const Center(child: CircularProgressIndicator());
//     }
//     return SizedBox();
//   },
// ),