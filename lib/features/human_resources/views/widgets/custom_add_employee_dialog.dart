// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/core/widgets/custom_text_field.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';
import 'package:hospital_management_system/features/human_resources/cubit/human_resources_cubit.dart';
import 'package:iconsax/iconsax.dart';

Future<dynamic> showCustomAddEmployeeDialog(BuildContext context){
  TextEditingController nameController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController ruleController = TextEditingController();

  return showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: backgroundColor,
        content: SizedBox(
          width: 300,
          height: 500,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomDialogImage(image: "assets/logos/Screenshot_20240911-174957_Chrome-removebg-preview (2).png"),
                const SizedBox(height: Sizes.spaceBtwSections,),
                CustomTextField(
                  controller: nameController,
                  type: TextInputType.name,
                  validator: (value){},
                  label: "اسم الموظف",
                  suffix: Iconsax.user,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: departmentController,
                  type: TextInputType.name,
                  validator: (value){},
                  label: "رقم القسم",
                  suffix: Iconsax.activity,
                ),
                const SizedBox(height: Sizes.spaceBtwItems,),
                CustomTextField(
                  controller: ruleController,
                  type: TextInputType.name,
                  validator: (value){},
                  label: "الوظيفة",
                  suffix: Iconsax.activity,
                ),
              ],
            ),
          ),
        ),
        actions: [
          BlocConsumer<HumanResourcesCubit, HumanResourcesState>(
            listener: (context, state){
              if(state is AddEmployeeSuccessState){
                print("Added");
                print("Added");
                print("Added");
                showToast("تمت اضافة الموظف بنجاح", ToastState.SUCCESS);
                navigateAndFinish(context, const DrawerLayout());
              }else if(state is AddEmployeeFailureState){
                showToast("حدث خطأ ما يرجى التأكد من معلومات المدخلة", ToastState.ERROR);
              }
            },
            builder: (context, state){
              return CustomButton(
                function: (){
                  if(nameController.text != null  && departmentController.text != null && ruleController.text != null){
                    HumanResourcesCubit.get(context).addEmployee(
                      name: nameController.text,
                      departmantID: departmentController.text,
                      rule: ruleController.text
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
    },
  );
}