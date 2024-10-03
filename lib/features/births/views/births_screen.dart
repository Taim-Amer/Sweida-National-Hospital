import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_shimmer_list.dart';
import 'package:hospital_management_system/features/births/cubit/births_cubit.dart';
import 'package:hospital_management_system/features/births/views/widgets/custom_births_list.dart';

class BirthsScreen extends StatelessWidget {
  const BirthsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBackgroundColor,
      body: BlocProvider(
        create: (context) => BirthsCubit()..allBirths(),
        child: Padding(
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
              const SizedBox(height: Sizes.spaceBtwSections),
              Expanded(
                flex: 6,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: BlocBuilder<BirthsCubit, BirthsState>(
                        builder: (context, state){
                          if(state is AllBirthsSuccessState) {
                            return CustomBirthsList(allBirthsModel: state.allBirthsModel);
                          }else if(state is AllBirthsLoadingState){
                            return const CustomShimmerList(shimmerItemCount: 6);
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                    const SizedBox(width: Sizes.spaceBtwSections,),
                    Expanded(
                      flex: 2,
                      child: BlocBuilder<BirthsCubit, BirthsState>(
                        builder: (context, state){
                          if(state is AllBirthsSuccessState) {
                            return CustomBirthsList(allBirthsModel: state.allBirthsModel);
                          }else if(state is AllBirthsLoadingState){
                            return const CustomShimmerList(shimmerItemCount: 6);
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
    );
  }
}

List<String> logos = [
  "assets/logos/Screenshot_20240911-174949_Chrome-removebg-preview.png",
  "assets/logos/Screenshot_20240911-174957_Chrome-removebg-preview.png",
  "assets/logos/Screenshot_20240911-175359_Gallery-removebg-preview.png"
];