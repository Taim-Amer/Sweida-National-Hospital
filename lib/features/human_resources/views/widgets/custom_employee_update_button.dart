import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/human_resources/cubit/human_resources_cubit.dart';

class CustomEmployeeUpdateButton extends StatelessWidget {
  const CustomEmployeeUpdateButton({super.key, required this.newNameController, required this.newDepartmentIDController, required this.employeeID});

  final TextEditingController newNameController;
  final TextEditingController newDepartmentIDController;
  final int employeeID;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HumanResourcesCubit, HumanResourcesState>(
      listener: (context, state){
        if(state is UpdateEmployeeSuccessState){
          showToast("تم اجراء التعديل بنجاح", ToastState.SUCCESS);
          navigateAndFinish(context, const DrawerLayout());
        }else if(state is UpdateEmployeeFailureState) {
          showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.ERROR);
        }
      },
      builder: (context, state){
        return CustomButton(
          function: (){
            int? departmentID = int.tryParse(newDepartmentIDController.text);
            HumanResourcesCubit.get(context).updateEmployee(name: newNameController.text, employeeID: employeeID, departmentID: departmentID!);
          },
          text: "تعديل",
        );
      },
    );
  }
}
