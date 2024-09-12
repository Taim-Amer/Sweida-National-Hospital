import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:hospital_management_system/core/widgets/custom_button.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_patient_file_dialog.dart';
import 'package:hospital_management_system/features/home/widgets/custom_regular_transfer_dialog.dart';
import 'package:hospital_management_system/features/patients/cubit/patients_cubit.dart';
import 'package:hospital_management_system/features/tests/cubit/tests_cubit.dart';
import 'package:iconsax/iconsax.dart';

class CustomRegularPatientCard extends StatelessWidget {
  CustomRegularPatientCard({super.key, required this.fullName, required this.id});

  final String fullName;
  final int id;

  TextEditingController targetDepartment = TextEditingController();

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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BlocConsumer<TestsCubit, TestsState>(
              listener: (context, state){
                if(state is RegularXRayRequestSuccessState){
                  showToast("تم اضافة المريض المقيم الى طابور الانتظار لقسم الصور الشعاعية", ToastState.SUCCESS);
                }else if(state is RegularXRayRequestFailureState){
                  showToast("حدث خطأ ما يرجى اعادة المحاولة لاحقا", ToastState.ERROR);
                }
              },
              builder: (context, state){
                return CustomButton(
                    function: (){
                      TestsCubit.get(context).regularXrayRequest(patientID: id);
                    },
                    text: "صورة شعاعية",
                    width: 100,
                    color: Colors.deepOrangeAccent,
                );
              },
            ),
            const SizedBox(
              width: Sizes.spaceBtwItems,
            ),
            BlocConsumer<TestsCubit, TestsState>(
              listener: (context, state){
                if(state is RegularTestRequestSuccessState){
                  showToast("تم اضافة المريض المقيم الى طابور الانتظار لقسم التحاليل", ToastState.SUCCESS);
                }else if(state is RegularTestRequestFailureState){
                  showToast("حدث خطأ ما يرجى اعادة المحاولة لاحقا", ToastState.ERROR);
                }
              },
              builder: (context, state){
                return CustomButton(
                  function: (){
                    TestsCubit.get(context).regularTestRequest(patientID: id);
                  },
                  text: "تحاليل",
                  width: 90,
                  color: Colors.pinkAccent,
                );
              },
            ),
            const SizedBox(width: Sizes.spaceBtwItems),
            BlocBuilder<PatientsCubit, PatientsState>(
              builder: (context, state){
                return CustomButton(
                    function: (){
                      PatientsCubit.get(context).getPatientFile(patientID: id);
                      if(state is PatientFileSuccessState){
                        return showRegularPatientFileDialog(
                            context,
                            state.patientFileModel.data!.other!.departmentId?? 0,
                            state.patientFileModel.data!.other!.patientId?? 0,
                            state.patientFileModel.data!.patientInfo!.fullName ?? "",
                            state.patientFileModel.data!.patientInfo!.address ?? "",
                            state.patientFileModel.data!.patientInfo!.dateOfBirth ?? "",
                            state.patientFileModel.data!.patientInfo!.momName ?? "",
                            state.patientFileModel.data!.patientInfo!.gender ?? "",
                        );
                      }
                    },
                    text: "عرض الملف",
                    width: 90,
                    color: Colors.amberAccent,
                );
              },
            ),
            const SizedBox(width: Sizes.spaceBtwItems),
            BlocBuilder<PatientsCubit, PatientsState>(
                builder: (context, state){
                  return CustomButton(
                      function: (){
                        return showRegularTransferDialog(
                            context,
                            targetDepartment,
                            id,
                        );
                      },
                      text: "تحويل",
                      width: 90,
                      color: Colors.blueAccent,
                  );
                },
            ),
            const Spacer(),
            titleText("$id.$fullName", color: defaultDarkColor, size: 18),
            const SizedBox(width: Sizes.spaceBtwItems),
            const Icon(Iconsax.verify, size: 40, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
