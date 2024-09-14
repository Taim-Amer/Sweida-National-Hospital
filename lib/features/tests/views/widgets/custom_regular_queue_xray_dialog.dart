import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';
import 'package:hospital_management_system/features/tests/models/all_regular_xray_model.dart';
import 'package:hospital_management_system/features/tests/views/widgets/custom_get_regular_xray_button.dart';
import 'package:iconsax/iconsax.dart';

Future<dynamic> showRegularQueueXrayDialog(BuildContext context, AllRegularXrayModel allRegularXrayModel) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Image(image: NetworkImage("assets/logos/Screenshot_20240912-114218_Chrome-removebg-preview.png"),),
        content: SizedBox(
          width: 600,
          height: 500,
          child: ListView.builder(
            itemCount: allRegularXrayModel.allPatientInXRayQueue!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: Sizes.spaceBtwItems / 2),
                decoration: BoxDecoration(
                  color: defaultLightColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(Sizes.md),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomGetRegularXrayButton(patientID: allRegularXrayModel.allPatientInXRayQueue![index].patientId ?? 0,),
                      const Spacer(),
                      titleText(allRegularXrayModel.allPatientInXRayQueue![index].patient!.fullName ?? "", color: defaultDarkColor, size: 18),
                      const SizedBox(width: Sizes.spaceBtwItems),
                      const Icon(Iconsax.verify, size: 40, color: Colors.green),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        actions: const [
          CustomCancelButton(),
        ],
      );
    },
  );
}
