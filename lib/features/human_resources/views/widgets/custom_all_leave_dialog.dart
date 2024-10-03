import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/human_resources/model/all_absent_in_date_model.dart';
import 'package:iconsax/iconsax.dart';

Future<dynamic> showCustomAllLeaveDialog(BuildContext context, AllAbsentInDateModel allAbsentModel){
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: const CustomDialogImage(
        //     image: "assets/logos/Screenshot_20240911-174957_Chrome-removebg-preview (2).png"),
        content: SizedBox(
          width: 800,
          height: 500,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: allAbsentModel.allAbcentInDate!.length,
            itemBuilder: (context, index) {
              var model = allAbsentModel.allAbcentInDate![index];
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
                      // CustomEmployeeDeleteButton(empID: employeeID,),
                      // const SizedBox(width: Sizes.spaceBtwItems),
                      // CustomButton(
                      //   function: () {
                      //     showCustomEmployeeUpdateDialog(context, name, departmentID, employeeID);
                      //   },
                      //   text: "تعديل",
                      //   width: 100,
                      // ),
                      // const SizedBox(width: Sizes.spaceBtwItems),
                      // CustomAttendanceButton(employeeID: employeeID),
                      // const SizedBox(width: Sizes.spaceBtwItems),
                      // CustomAbsentLeaveButton(employeeID: employeeID),
                      // const SizedBox(width: Sizes.spaceBtwItems),
                      // CustomAbsentPenaltyButton(employeeID: employeeID),
                      const Spacer(),
                      titleText(allAbsentModel.allAbcentInDate![index].id.toString(), color: defaultDarkColor, size: 18),
                      const SizedBox(width: Sizes.spaceBtwItems),
                      const Icon(Iconsax.verify, size: 40, color: Colors.green),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}