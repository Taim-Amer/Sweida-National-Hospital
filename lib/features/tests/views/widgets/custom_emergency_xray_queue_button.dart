import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/features/tests/cubit/tests_cubit.dart';
import 'package:hospital_management_system/features/tests/views/widgets/custom_emergency_queue_xray_dialog.dart';
import 'package:iconsax/iconsax.dart';

class CustomEmergencyXrayQueueButton extends StatelessWidget {
  const CustomEmergencyXrayQueueButton({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: BlocConsumer<TestsCubit, TestsState>(
        listener: (context, state){
          if(state is AllEmergencyXraySuccessState){
            showEmergencyQueueXrayDialog(context, state.allEmergencyXrayModel);
          }else if(state is AllEmergencyXrayFailureState){
            showToast("لا يوجد مرضى على طابور الانتظار", ToastState.ERROR);
          }
        },
        builder: (context, state){
          return MaterialButton(
            onPressed: () {
              TestsCubit.get(context).allEmergencyXrayPatients();
            },
            splashColor: Colors.transparent,
            child: const ListTile(
              leading: Icon(Iconsax.square, color: thirdColor),
              title: Text(
                "الطابور",
                style: TextStyle(
                  fontSize:  18,
                  color: thirdColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
