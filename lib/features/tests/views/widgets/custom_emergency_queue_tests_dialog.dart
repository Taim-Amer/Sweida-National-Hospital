import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';
import 'package:hospital_management_system/features/tests/models/all_emergency_tests_model.dart';
import 'package:hospital_management_system/features/tests/views/widgets/custom_get_emergency_test_button.dart';
import 'package:iconsax/iconsax.dart';

Future<dynamic> showEmergencyQueueTestDialog(BuildContext context, AllEmergencyTestsModel allEmergencytestModel) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Image(image: NetworkImage("assets/logos/Screenshot_20240912-114229_Chrome-removebg-preview.png"),),
        content: SizedBox(
          width: 200,
          height: 500,
          child: ListView.builder(
            itemCount: allEmergencytestModel.allPatientInEmergencyTestQueue!.length,
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
                      CustomGetEmergencyTestButton(patientID: allEmergencytestModel.allPatientInEmergencyTestQueue![index].patientId ?? 0,),
                      const Spacer(),
                      titleText(allEmergencytestModel.allPatientInEmergencyTestQueue![index].patient!.fullName ?? "", color: defaultDarkColor, size: 18),
                      const SizedBox(width: Sizes.spaceBtwItems),
                      const Icon(Iconsax.warning_2, size: 40, color: Colors.redAccent),
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
