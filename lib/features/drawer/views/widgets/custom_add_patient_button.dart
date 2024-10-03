import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/home/widgets/custom_add_patients_dialog.dart';
import 'package:hospital_management_system/features/patients/cubit/patients_cubit.dart';
import 'package:iconsax/iconsax.dart';

class CustomAddPatientButton extends StatelessWidget {
  CustomAddPatientButton({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController chainController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController caseController = TextEditingController();
  TextEditingController treatmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientsCubit, PatientsState>(
      listener: (context, state){
        if(state is AddPatientSuccessState){
          showToast("تمت اضافة المريض بنجاح الى قسم الاسعافات", ToastState.SUCCESS);
          navigateAndFinish(context, const DrawerLayout());
        }else if(state is AddPatientFailureState){
          showToast("حدث خطأ ما يرجى التأكد من معلومات المريض المدخلة", ToastState.ERROR);
        }
      },
      builder: (context, state){
        return Container(
          height: 50,
          decoration: BoxDecoration(
            color: defaultLightColor,
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
              showPatientAddDialog(context, nameController, addressController, birthDateController, motherNameController, chainController, genderController, caseController, treatmentController);
            },
            splashColor: Colors.transparent,
            child: const ListTile(
              leading: Icon(Iconsax.add, color: thirdColor),
              title: Text(
                "اضافة مريض",
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
