import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:hospital_management_system/core/styles/sizes.dart";
import "package:hospital_management_system/core/widgets/custom_button.dart";
import "package:hospital_management_system/core/widgets/custom_dialog_image.dart";
import "package:hospital_management_system/core/widgets/custom_text_field.dart";
import "package:hospital_management_system/core/widgets/custom_toast_widget.dart";
import "package:hospital_management_system/core/widgets/navigate_items.dart";
import "package:hospital_management_system/features/drawer/views/drawer_layout.dart";
import "package:hospital_management_system/features/home/widgets/custom_cancel_button.dart";
import "package:hospital_management_system/features/medical_store_keeper/cubit/medical_store_keeper_cubit.dart";

Future<dynamic> showCustomMedicalStoreEditDialog(BuildContext context, int medicalID, String name, String quantity) {
  TextEditingController newNameController = TextEditingController();
  TextEditingController newQuantityController = TextEditingController();

  return showDialog(
    context: context,
    builder: (context) {
      newNameController.text = name;
      newQuantityController.text = quantity;
      return AlertDialog(
        title: const CustomDialogImage(image: "assets/logos/Screenshot_20240911-174957_Chrome-removebg-preview (2).png"),
        content: Column(
          children: [
            CustomTextField(
              controller: newNameController,
              label: "الاسم",
              type: TextInputType.name,
              validator: (value) {},
            ),
            const SizedBox(height: Sizes.spaceBtwItems),
            CustomTextField(
              controller: newQuantityController,
              label: "الكمية",
              type: TextInputType.name,
              validator: (value) {},
            ),
          ],
        ),
        actions: [
          BlocConsumer<MedicalStoreKeeperCubit, MedicalStoreKeeperState>(
            listener: (context, state) {
              if (state is UpdateResourcesSuccessState) {
                showToast("تم اجراء التعديل بنجاح", ToastState.SUCCESS);
                navigateAndFinish(context, const DrawerLayout());
              } else if (state is UpdateResourcesFailureState) {
                showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.ERROR);
              }
            },
            builder: (context, state) {
              return CustomButton(
                function: () {
                  int? quantity = int.tryParse(newQuantityController.text);
                  MedicalStoreKeeperCubit.get(context).updateResources(
                    name: newNameController.text,
                    quantity: newQuantityController.text,
                    id: medicalID
                  );
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
