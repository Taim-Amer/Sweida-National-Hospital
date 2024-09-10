import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/features/departments/cubit/departments_cubit.dart';
import 'package:hospital_management_system/features/home/widgets/custom_add_patients_dialog.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_patient_card.dart';
import 'package:hospital_management_system/features/patients/cubit/patients_cubit.dart';

import 'widgets/custom_emergency_patient_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController chainController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController caseController = TextEditingController();
  TextEditingController treatmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => PatientsCubit(),
        // ),
        BlocProvider(
          create: (context) {
            // int? id = int.tryParse(LoginBodyWidget.departmentController.text);
            return DepartmentsCubit()..getAllEmergencyPatient();
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
                              image: AssetImage(
                                  "assets/images/medicine.png",
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: Sizes.spaceBtwSections),
                SizedBox(
                  // width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BlocBuilder<PatientsCubit, PatientsState>(
                        builder: (context, state){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Sizes.md),
                            child: CustomButton(
                              function: (){
                                showPatientAddDialog(context, nameController, addressController, birthDateController, motherNameController, genderController, chainController, caseController, treatmentController);
                              },
                              text: "اضافة مريض",
                              labelColor: thirdColor,
                              width: 100,
                            ),
                          );
                        },
                      ),
                    ],
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
                        child: Column(
                          children: [
                            BlocBuilder<DepartmentsCubit, DepartmentsState>(
                              builder: (context, state) {
                                if (state is AllEmergencyPatientSuccessState) {
                                  return CustomEmergencyPatientList(allEmergencyPatientModel: state.allEmergencyPatientModel);
                                }
                                return const SizedBox();
                              },
                            ),
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
                          ],
                        ),
                      ),
                      const SizedBox(width: Sizes.spaceBtwSections),
                      Expanded(
                        flex: 2,
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const CustomRegularPatientCard();
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