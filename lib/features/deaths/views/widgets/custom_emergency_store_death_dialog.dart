import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_date_picker.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/core/widgets/custom_text_field.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/deaths/cubit/deaths_cubit.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';

Future<dynamic> showStoreEmergencyDeathDialog(BuildContext context, String id){
  TextEditingController reasonDeathController = TextEditingController();
  TextEditingController dateDeathController = TextEditingController();
  TextEditingController hourDeathController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: backgroundColor,
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomDialogImage(image: "assets/logos/Screenshot_20240911-175004_Chrome-removebg-preview.png"),
              const SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              CustomTextField(
                controller: hourDeathController,
                type: TextInputType.text,
                validator: (v) {},
                label: "ساعة الوفاة",
              ),
              const SizedBox(
                height: Sizes.spaceBtwInputField,
              ),
              CustomDatePicker(
                dateController: dateDeathController,
                hint: "تاريخ الوفاة",
              ),
              const SizedBox(
                height: Sizes.spaceBtwInputField,
              ),
              CustomTextField(
                controller: reasonDeathController,
                type: TextInputType.text,
                validator: (v) {},
                label: "سبب الوفاة",
              ),
              const SizedBox(
                height: Sizes.spaceBtwInputField,
              ),
            ],
          ),
        ),
        actions: [
          BlocConsumer<DeathsCubit, DeathsState>(
            listener: (context, state) {
              if(state is StoreEmergencyDeathSuccessState){
                showToast("تم اضافة حالة الوفاة", ToastState.SUCCESS);
                navigateAndFinish(context, const DrawerLayout());
              }
            },
            builder: (context, state) {
              return CustomButton(
                function: () {
                  print(dateDeathController.text);
                  print(hourDeathController.text);
                  print(reasonDeathController.text);
                  print(id);
                  DeathsCubit.get(context).storeEmergencyDeath(id: int.parse(id),
                      deathDate: dateDeathController.text,
                      hourDate: hourDeathController.text,
                      reasonOfDeath: reasonDeathController.text);
                },
                text: "تم",
              );
            },
          ),
          const SizedBox(height: Sizes.spaceBtwInputField,),
          const CustomCancelButton()
        ],
      );
    },
  );
}