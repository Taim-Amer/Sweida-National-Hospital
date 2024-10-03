import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:hospital_management_system/core/styles/sizes.dart";
import "package:hospital_management_system/core/widgets/custom_button.dart";
import "package:hospital_management_system/core/widgets/custom_text_field.dart";
import "package:hospital_management_system/core/widgets/custom_toast_widget.dart";
import "package:hospital_management_system/features/deaths/cubit/deaths_cubit.dart";
import "package:hospital_management_system/features/home/widgets/custom_cancel_button.dart";

Future<dynamic> showCustomNameEditDialog(BuildContext context, int deathID){
  TextEditingController newNameController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: CustomTextField(
          controller: newNameController,
          label: "الاسم الجديد",
          type: TextInputType.name,
          validator: (value){},
        ),
        actions: [
          BlocConsumer<DeathsCubit, DeathsState>(
            listener: (context, state){
              if(state is UpdateDeathSuccessState){
                showToast("تم تعديل الاسم بنجاح", ToastState.SUCCESS);
              }else if(state is UpdateDeathFailureState) {
                showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.ERROR);
              }
            },
            builder: (context, state){
              return CustomButton(
                function: (){
                  DeathsCubit.get(context).updateDeath(name: newNameController.text, id: deathID);
                },
                text: "تعديل",
              );
            },
          ),
          const SizedBox(height: Sizes.spaceBtwItems),
          const CustomCancelButton()
        ],
      );
    },
  );
}