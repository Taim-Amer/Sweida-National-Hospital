import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_shimmer_list.dart';
import 'package:hospital_management_system/features/surgery/cubit/surgery_cubit.dart';
import 'widgets/custom_emergency_surgery_patient_list.dart';
import 'widgets/custom_regular_surgery_patient_list.dart';

class SurgeryScreen extends StatelessWidget {
  const SurgeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurgeryCubit()..allRegularSurgery()..allEmergencySurgery(),
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
                              child: Image(fit: BoxFit.cover, image: NetworkImage(logos[index]),
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
                          child: BlocBuilder<SurgeryCubit, SurgeryState>(
                              builder: (context, state){
                                if(state.allEmergencySurgeryModel != null){
                                  return CustomEmergencySurgeryPatientList(allEmergencySurgeryModel: state.allEmergencySurgeryModel!);
                                }else if(state.isLoadingEmergencySurgery){
                                  return const CustomShimmerList(shimmerItemCount: 7);
                                }
                                return const SizedBox();
                              }),
                        ),
                        const SizedBox(width: Sizes.spaceBtwSections),
                        Expanded(
                          flex: 2,
                          child: BlocBuilder<SurgeryCubit, SurgeryState>(
                            builder: (context, state){
                              if(state.allRegularSurgeryModel != null){
                                return CustomRegularSurgeryPatientList(allRegularSurgeryModel: state.allRegularSurgeryModel!);
                              }else if(state.isLoadingRegularSurgery){
                                return const CustomShimmerList(shimmerItemCount: 7);
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
            )
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