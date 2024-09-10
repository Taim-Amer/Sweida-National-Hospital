import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_text_field.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';
import 'package:hospital_management_system/features/patients/cubit/patients_cubit.dart';
import 'package:iconsax/iconsax.dart';

Future<dynamic> showPatientAddDialog(BuildContext context, TextEditingController nameController, TextEditingController addressController, TextEditingController birthDateController, TextEditingController motherNameController, TextEditingController chainController, TextEditingController genderController, TextEditingController caseController, TextEditingController treatmentController){
  return showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: backgroundColor,
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                  height: 300,
                  width: 400,
                  child: Image(image: AssetImage("assets/images/MoH_Logo-removebg-preview.png"))),
              const SizedBox(height: Sizes.spaceBtwSections,),
              CustomTextField(
                controller: nameController,
                type: TextInputType.name,
                validator: (value){},
                label: "اسم المريض",
                suffix: Iconsax.user,
              ),
              const SizedBox(height: Sizes.spaceBtwItems,),
              CustomTextField(
                controller: addressController,
                type: TextInputType.name,
                validator: (value){},
                label: "العنوان",
                suffix: Iconsax.home,
              ),
              const SizedBox(height: Sizes.spaceBtwItems,),
              CustomTextField(
                controller: birthDateController,
                type: TextInputType.name,
                validator: (value){},
                label: "تاريخ الميلاد",
                suffix: Iconsax.calendar,
              ),
              const SizedBox(height: Sizes.spaceBtwItems,),
              CustomTextField(
                controller: motherNameController,
                type: TextInputType.name,
                validator: (value){},
                label: "اسم الام",
                suffix: Iconsax.woman,
              ),
              const SizedBox(height: Sizes.spaceBtwItems,),
              CustomTextField(
                controller: chainController,
                type: TextInputType.name,
                validator: (value){},
                label: "رقم القيد",
                suffix: Icons.numbers,
              ),
              const SizedBox(height: Sizes.spaceBtwItems,),
              CustomTextField(
                controller: genderController,
                type: TextInputType.name,
                validator: (value){},
                label: "الجنس",
                suffix:  Iconsax.man,
              ),
              const SizedBox(height: Sizes.spaceBtwItems,),
              CustomTextField(
                controller: caseController,
                type: TextInputType.name,
                validator: (value){},
                label: "وصف الحالة",
                suffix: Iconsax.health,
              ),
              const SizedBox(height: Sizes.spaceBtwItems,),
              CustomTextField(
                controller: treatmentController,
                type: TextInputType.name,
                validator: (value){},
                label: "العلاج المطلوب",
                suffix: Icons.local_pharmacy_outlined,
              ),
            ],
          ),
        ),
        actions: [
          BlocConsumer<PatientsCubit, PatientsState>(
            listener: (context, state){
              if(state is AddPatientSuccessState){
                showToast(state.addPatientModel.message ?? "", ToastState.SUCCESS);
              }else if(state is AddPatientFailureState){
                showToast("الرجاء التأكد من المعلومات المدخلة", ToastState.ERROR);
              }
            },
            builder: (context, state){
              return CustomButton(
                function: (){
                  int? chain = int.tryParse(chainController.text);
                  if(nameController != null && addressController != null && birthDateController != null && motherNameController != null && chain != null && genderController != null && caseController != null && treatmentController != null){
                    PatientsCubit.get(context).addPatient(
                      fullName: nameController.text,
                      address: addressController.text,
                      dateOfBirth: birthDateController.text,
                      motherName: motherNameController.text,
                      chain: chain,
                      gender: genderController.text,
                      caseDescriptions: caseController.text,
                      treatmentRequired: treatmentController.text,
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
