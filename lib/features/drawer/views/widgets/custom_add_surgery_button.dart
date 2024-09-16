import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/features/home/widgets/custom_add_surgery_dialog.dart';
import 'package:hospital_management_system/features/surgery/cubit/surgery_cubit.dart';
import 'package:iconsax/iconsax.dart';

class CustomAddSurgeryButton extends StatelessWidget {
  CustomAddSurgeryButton({super.key});

  TextEditingController patientIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurgeryCubit, SurgeryState>(
      listener: (context, state){
        if(state is AddEmergencySurgerySuccessState || state is AddRegularSurgerySuccessState){
          showToast("تم اضافة المريض الى سجل العمليات في قسم الجراحة", ToastState.SUCCESS);
        }else if(state is AddEmergencySurgeryFailureState || state is AddRegularSurgeryFailureState){
          showToast("حدث خطأ ما يرجى التأكد من المعلومات المدخلة او المحاولة لاحقا", ToastState.ERROR);
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
              showSurgeryAddDialog(context, patientIdController);
            },
            splashColor: Colors.transparent,
            child: const ListTile(
              leading: Icon(Iconsax.add, color: thirdColor),
              title: Text(
                "اضافة عملية",
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
