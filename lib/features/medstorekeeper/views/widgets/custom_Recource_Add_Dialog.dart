import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/features/medstorekeeper/cubit/medstorekeeperCubit.dart';
import 'package:hospital_management_system/features/medstorekeeper/cubit/medstorekeeperState.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/sizes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../home/widgets/custom_cancel_button.dart';

Future<dynamic> showRecourceAddDialog (BuildContext context, TextEditingController nameController, TextEditingController end_date, TextEditingController company, TextEditingController quantity, TextEditingController avaliable) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    height: 300,
                    width: 400,
                    child: Image(image: AssetImage(
                        "assets/images/MoH_Logo-removebg-preview.png"))),
                const SizedBox(height: Sizes.spaceBtwSections,),
                CustomTextField(
                  controller: nameController,
                  type: TextInputType.name,
                  validator: (value) {},
                  label: "اسم الدواء",
                  suffix: Iconsax.user,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: end_date,
                  type: TextInputType.name,
                  validator: (value) {},
                  label: "تاريخ الصلاحية",
                  suffix: Iconsax.home,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: company,
                  type: TextInputType.name,
                  validator: (value) {},
                  label: "الشركة المصنعة",
                  suffix: Iconsax.calendar,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: quantity,
                  type: TextInputType.number,
                  validator: (value) {},
                  label: "الكمية",
                  suffix: Iconsax.woman,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: avaliable,
                  type: TextInputType.number,
                  validator: (value) {},
                  label: "قابل للصرف",
                  suffix: Icons.numbers,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
              ],
            ),
          ),
          actions: [
            BlocBuilder<MedstorekeeperCubit, medstorekeeperState>(
              builder: (context, state) {
                return CustomButton(
                  function: () {
                    int? quan = int.tryParse(quantity.text);
                    if (nameController != null && quantity != null &&
                        company != null && avaliable != null) {
                      MedstorekeeperCubit.get(context).storeresource(
                          name: nameController.text,
                          quantity: quan!,
                          end_date: end_date.text,
                          availability_status: int.tryParse(avaliable.text)!,
                          company: company.text
                      );
                    }
                  },
                  text: "اضافة",
                );
              },
            ),
            const SizedBox(height: Sizes.spaceBtwItems,),
            const CustomCancelButton()
          ],
        );
      }
  );
}
