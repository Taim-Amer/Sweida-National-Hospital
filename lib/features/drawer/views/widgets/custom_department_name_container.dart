import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';
import 'package:hospital_management_system/features/departments/cubit/departments_cubit.dart';

class CustomDepartmentNameContainer extends StatelessWidget {
  const CustomDepartmentNameContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentsCubit, DepartmentsState>(
      builder: (context, state){
        return Container(
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
          width: 200,
          height: 50,
          child: state.specificDepartmentModel != null ? Center(child: detailsText(state.specificDepartmentModel!.depDetails!.name ?? "", size: 18, color: thirdColor)) : const SizedBox(),
        );
      },
    );
  }
}
