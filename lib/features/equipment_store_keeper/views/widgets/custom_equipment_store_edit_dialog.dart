import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_dialog_image.dart';
import 'package:hospital_management_system/core/widgets/custom_text_field.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/cubit/equipment_store_keeper_cubit.dart';
import 'package:hospital_management_system/features/home/widgets/custom_cancel_button.dart';

Future<dynamic> showCustomEquipmentStoreEditDialog(BuildContext context, int equipmentID, String name, String quantity, String description){
  TextEditingController newNameController = TextEditingController();
  TextEditingController newDescriptionController = TextEditingController();
  TextEditingController newQuantityController = TextEditingController();

  return showDialog(
    context: context,
    builder: (context) {
      newNameController.text = name;
      newQuantityController.text = quantity;
      newDescriptionController.text = description;
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
            const SizedBox(height: Sizes.spaceBtwItems),
            CustomTextField(
              controller: newDescriptionController,
              label: "الوصف",
              type: TextInputType.name,
              validator: (value) {},
            ),
          ],
        ),
        actions: [
          BlocConsumer<EquipmentStoreKeeperCubit, EquipmentStoreKeeperState>(
            listener: (context, state) {
              if (state is UpdateEquipmentsSuccessState) {
                showToast("تم اجراء التعديل بنجاح", ToastState.SUCCESS);
                navigateAndFinish(context, const DrawerLayout());
              } else if (state is UpdateEquipmentsFailureState) {
                showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.ERROR);
              }
            },
            builder: (context, state) {
              return CustomButton(
                function: () {
                  int? quantity = int.tryParse(newQuantityController.text);
                  EquipmentStoreKeeperCubit.get(context).updateEquipments(
                      name: newNameController.text,
                      quantity: newQuantityController.text,
                      description: newDescriptionController.text,
                      id: equipmentID
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