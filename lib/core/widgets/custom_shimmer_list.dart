import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerList extends StatelessWidget {
  const CustomShimmerList({super.key, required this.shimmerItemCount});

  final int shimmerItemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shimmerItemCount,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.only(bottom: Sizes.spaceBtwItems),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[400]!,
            highlightColor: Colors.grey[200]!,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
    );
  }
}
