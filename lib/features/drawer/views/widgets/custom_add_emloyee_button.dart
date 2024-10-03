import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/human_resources/cubit/human_resources_cubit.dart';
import 'package:hospital_management_system/features/medical_store_keeper/views/widgets/custom_add_medical_dialog.dart';
import 'package:iconsax/iconsax.dart';

class CustomAddEmloyeeButton extends StatelessWidget {
  const CustomAddEmloyeeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HumanResourcesCubit, HumanResourcesState>(
      listener: (context, state){
        if(state is AddEmployeeSuccessState){
          showToast("تمت اضافة الموظف بنجاح", ToastState.SUCCESS);
          navigateAndFinish(context, const DrawerLayout());
        }else if(state is AddEmployeeFailureState){
          showToast("حدث خطأ ما يرجى التأكد من معلومات المدخلة", ToastState.ERROR);
        }
      },
      builder: (context, state){
        return Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            boxShadow: [
              BoxShadow(
                color: defaultLightColor.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: MaterialButton(
            onPressed: () {
              // showCustomAddMedicalDialog(context);
            },
            splashColor: Colors.transparent,
            child: const ListTile(
              leading: Icon(Iconsax.add, color: thirdColor),
              title: Text(
                "اضافة موظف",
                style: TextStyle(
                  fontSize:  18,
                  color: thirdColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
