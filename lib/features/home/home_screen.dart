import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_shimmer_list.dart';
import 'package:hospital_management_system/features/departments/cubit/departments_cubit.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/cubit/equipment_store_keeper_cubit.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/views/widgets/custom_equipment_store_keeper_list.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_patient_list.dart';
import 'package:hospital_management_system/features/login/views/widgets/login_body_widget.dart';
import 'package:hospital_management_system/features/medical_store_keeper/cubit/medical_store_keeper_cubit.dart';
import 'package:hospital_management_system/features/medical_store_keeper/views/widgets/custom_medical_store_keeper_list.dart';
import 'package:hospital_management_system/features/tests/cubit/tests_cubit.dart';
import 'widgets/custom_emergency_patient_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int? departmentID = int.tryParse(LoginBodyWidget.departmentController.text);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            int? departmentID = int.tryParse(LoginBodyWidget.departmentController.text);
            return DepartmentsCubit()..getAllEmergencyPatient()..getAllPatientInDepartment(departmentId: departmentID!);
          },
        ),
        BlocProvider(
          create: (context) => TestsCubit(),
        ),
      ],
      child: Scaffold(
        backgroundColor: screenBackgroundColor,
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
                              color: const Color(0xff4f646f).withOpacity(.2),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Image(fit: BoxFit.cover, image: NetworkImage(logos[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // departmentID == 1 ? const SizedBox(height: Sizes.sm) : const SizedBox(),
              // departmentID == 1 ? Expanded(
              //   flex: 1,
              //   child: Row(
              //     children: [
              //       // CustomAbsentLeaveFilterRow(),
              //       const Spacer(),
              //       CustomAbsentPenaltyFilterRow()
              //     ],
              //   ),
              // ) : const SizedBox(),
              const SizedBox(height: Sizes.sm),
              departmentID != 9 ? Expanded(
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
                          } else if(state.isLoadingEmergencyPatient) {
                            return const CustomShimmerList(shimmerItemCount: 6);
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                    const SizedBox(width: Sizes.spaceBtwItems),
                    departmentID != 2 ? Expanded(
                      flex: 2,
                      child: BlocBuilder<DepartmentsCubit, DepartmentsState>(
                        builder: (context, state){
                          if(state.allPatientInDepartmentModel != null){
                            return CustomRegularPatientList(allPatientInDepartmentModel: state.allPatientInDepartmentModel!);
                          } else if(state.isLoadingDepartmentPatient) {
                            return const CustomShimmerList(shimmerItemCount: 6);
                          }
                          return const SizedBox();
                        },
                      ),
                    ) : const SizedBox(),
                  ],
                ),
              ) : Expanded(
                flex: 6,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 2,
                        child: BlocBuilder<MedicalStoreKeeperCubit, MedicalStoreKeeperState>(
                          builder: (context, state){
                            if (state is AllResourcesSuccessState) {
                              return CustomMedicalStoreKeeperList(allResoursesModel: state.allResoursesModel);
                            } else if(state is AllResourcesLoadingState) {
                              return const CustomShimmerList(shimmerItemCount: 6);
                            }
                            return const SizedBox();
                          },
                        ),
                    ),
                    const SizedBox(width: Sizes.spaceBtwItems),
                    Expanded(
                        flex: 2,
                        child: BlocBuilder<EquipmentStoreKeeperCubit, EquipmentStoreKeeperState>(
                          builder: (context, state){
                            if (state is AllEquipmentsSuccessState) {
                              return CustomEquipmentStoreKeeperList(allEquipmentsModel: state.allEquipmentsModel);
                            } else if(state is AllEquipmentsLoadingState) {
                              return const CustomShimmerList(shimmerItemCount: 6);
                            }
                            return const SizedBox();
                          },
                        ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> logos = [
  "assets/logos/Screenshot_20240911-174949_Chrome-removebg-preview.png",
  "assets/logos/Screenshot_20240911-174957_Chrome-removebg-preview.png",
  "assets/logos/Screenshot_20240911-175359_Gallery-removebg-preview.png"
];


//decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [
//               defaultLightColor.withOpacity(0.75),
//               Colors.white,
//               secondDarkColor.withOpacity(0.3),
//             ],
//           ),
//         ),


// SizedBox(
//   height: 80,
//   child: Row(
//     children: [
//       Expanded(child: Padding(
//         padding: const EdgeInsets.all(Sizes.spaceBtwItems),
//         child: CustomButton(
//             function: (){
//               return showDialog(
//                   context: context,
//                   builder: (context){
//                     return AlertDialog(
//                       title: Text("سجل الولادات"),
//                     )
//                   },
//               )
//             },
//             text: "الولادات",
//         ),
//       )),
//       Expanded(child: Padding(
//         padding: const EdgeInsets.all(Sizes.spaceBtwItems),
//         child: CustomButton(
//             function: (){},
//             text: "الوفيات",
//         ),
//       )),
//     ],
//   ),
// ),
