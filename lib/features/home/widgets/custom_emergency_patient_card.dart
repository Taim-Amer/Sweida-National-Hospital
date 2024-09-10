import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/home/widgets/custom_emergency_patient_file_dialog.dart';
import 'package:hospital_management_system/features/home/widgets/custom_emergency_transfer_dialog.dart';
import 'package:hospital_management_system/features/patients/cubit/patients_cubit.dart';
import 'package:iconsax/iconsax.dart';

class CustomEmergencyPatientCard extends StatelessWidget {
  CustomEmergencyPatientCard({
    super.key,
    required this.fullName,
    required this.address,
    required this.birthDate,
    required this.motherName,
    required this.chain,
    required this.gender,
    required this.caseDescription,
    required this.treatmentRequired,
    required this.id,
  });

  final int id;
  final String fullName;
  final String address;
  final String birthDate;
  final String motherName;
  final int chain;
  final String gender;
  final String caseDescription;
  final String treatmentRequired;

  TextEditingController targetDepartmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Sizes.spaceBtwItems / 2),
      decoration: BoxDecoration(
        color: defaultLightColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocConsumer<PatientsCubit, PatientsState>(
              listener: (context, state){
                if(state is EmergencyTransferSuccessState){
                  showToast(state.emergencyTransferModel.message ?? "", ToastState.SUCCESS);
                }
              },
              builder: (context, state){
                return CustomButton(
                    function: () {
                      return showEmergencyTransferDialog(context, targetDepartmentController, id);
                    },
                    text: "تحويل",
                    width: 100,
                    labelColor: whiteColor,
                    color: Colors.greenAccent,
                  );
                },
            ),
            const SizedBox(
              width: Sizes.spaceBtwItems,
            ),
            BlocBuilder<PatientsCubit, PatientsState>(
              builder: (context, state) {
                return CustomButton(
                  function: () {
                    return showEmergencyPatientFileDialog(context, fullName, address, birthDate, motherName, gender, chain);
                  },
                  text: "التفاصيل",
                  width: 100,
                  labelColor: whiteColor,
                );
              },
            ),
            const Spacer(),
            titleText("$id.$fullName", color: defaultDarkColor, size: 18),
            const SizedBox(width: Sizes.spaceBtwItems),
            const Icon(Iconsax.warning_2, size: 40, color: Colors.redAccent),
          ],
        ),
      ),
    );
  }
}

