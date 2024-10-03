import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/human_resources/cubit/human_resources_cubit.dart';

class CustomEmployeeDeleteButton extends StatelessWidget {
  const CustomEmployeeDeleteButton({super.key, required this.empID});

  final int empID;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HumanResourcesCubit, HumanResourcesState>(
      listener: (context, state){
        if(state is DeleteEmployeeSuccessState){
          showToast("تم حذف الموظف بنجاح", ToastState.SUCCESS);
          navigateAndFinish(context, const DrawerLayout());
        }else if(state is DeleteEmployeeFailureState){
          showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.SUCCESS);
        }
      },
      builder: (context, state){
        return CustomButton(
          function: (){
            HumanResourcesCubit.get(context).deleteEmployee(employeeID: empID);
          },
          text: "حذف",
          color: Colors.redAccent,
          width: 100,
        );
      },
    );
  }
}