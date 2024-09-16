import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/home/widgets/custom_emergency_transfer_dialog.dart';
import 'package:hospital_management_system/features/patients/cubit/patients_cubit.dart';

class CustomEmergencyTransferButton extends StatelessWidget {
  const CustomEmergencyTransferButton({
    super.key,
    required this.targetDepartmentController,
    required this.id,
  });

  final TextEditingController targetDepartmentController;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientsCubit, PatientsState>(
      listener: (context, state){
        if(state is EmergencyTransferSuccessState){
          showToast("تم تحويل المريض الى القسم المطلوب كمريض اسعافي" ?? "", ToastState.SUCCESS);
          navigateAndFinish(context, const DrawerLayout());
        }else if (state is EmergencyTransferFailureState){
          showToast("حدث خطأ ما", ToastState.ERROR);
        }
      },
      builder: (context, state){
        return CustomButton(
          function: () {
            return showEmergencyTransferDialog(context, targetDepartmentController, id);
          },
          text: "تحويل",
          width: 90,
          labelColor: whiteColor,
          color: const Color(0xfff49097),
        );
      },
    );
  }
}
