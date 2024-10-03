import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/births/cubit/births_cubit.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';

class CustomBirthsUpdateButton extends StatelessWidget {
  const CustomBirthsUpdateButton({super.key, required this.birthID, required this.newNameController, required this.newFatherNameController, required this.newMotherNameController, required this.newCityNameController, required this.newBirthDateController});

  final int birthID;
  final TextEditingController newNameController;
  final TextEditingController newFatherNameController;
  final TextEditingController newMotherNameController;
  final TextEditingController newCityNameController;
  final TextEditingController newBirthDateController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BirthsCubit, BirthsState>(
      listener: (context, state){
        if(state is UpdateBirthSuccessState){
          showToast("تم التعديل بنجاح", ToastState.SUCCESS);
          navigateAndFinish(context, const DrawerLayout());
        }else if(state is UpdateBirthFailureState) {
          showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.ERROR);
        }
      },
      builder: (context, state){
        return CustomButton(
          function: (){
            BirthsCubit.get(context).updateBirth(id: birthID, name: newNameController.text, fatherName: newFatherNameController.text, motherName: newMotherNameController.text, city: newCityNameController.text, birthDate: newBirthDateController.text);
          },
          text: "تعديل",
        );
      },
    );;
  }
}
