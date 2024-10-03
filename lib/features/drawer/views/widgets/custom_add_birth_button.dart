import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/core/widgets/navigate_items.dart';
import 'package:hospital_management_system/features/births/cubit/births_cubit.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/births/views/widgets/custom_add_birth_dialog.dart';
import 'package:iconsax/iconsax.dart';

class CustomAddBirthButton extends StatelessWidget {
  const CustomAddBirthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BirthsCubit, BirthsState>(
      listener: (context, state){
        if(state is StoreBirthSuccessState){
          showToast("تمت اضافة المولود بنجاح", ToastState.SUCCESS);
          navigateAndFinish(context, const DrawerLayout());
        }else if(state is StoreBirthFailureState){
          showToast("حدث خطأ ما يرجى التأكد من معلومات المدخلة", ToastState.ERROR);
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
              showCustomAddBirthDialog(context);
            },
            splashColor: Colors.transparent,
            child: const ListTile(
              leading: Icon(Iconsax.add, color: thirdColor),
              title: Text(
                "اضافة مولود",
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
