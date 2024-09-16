import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';
import 'package:hospital_management_system/features/tests/models/all_regular_tests_model.dart';
import 'package:hospital_management_system/features/tests/views/widgets/custom_get_regular_test_button.dart';
import 'package:iconsax/iconsax.dart';

Future<dynamic> showRegularQueueTestDialog(BuildContext context, AllRegularTestsModel allRegularTestModel) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Image(image: NetworkImage("assets/logos/Screenshot_20240912-114229_Chrome-removebg-preview.png"),),
        content: SizedBox(
          width: 200,
          height: 500,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: allRegularTestModel.allPatientInTestQueue!.length,
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
                      CustomGetRegularTestButton(patientID: allRegularTestModel.allPatientInTestQueue![index].patientId ?? 0,),
                      const Spacer(),
                      titleText(allRegularTestModel.allPatientInTestQueue![index].patient!.fullName ?? "", color: defaultDarkColor, size: 18),
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
