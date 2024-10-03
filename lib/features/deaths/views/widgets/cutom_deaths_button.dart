import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/features/deaths/cubit/deaths_cubit.dart';
import 'package:hospital_management_system/features/deaths/views/widgets/custom_deaths_dialog.dart';
import 'package:iconsax/iconsax.dart';

class CustomDeathsButton extends StatelessWidget {
  const CustomDeathsButton({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: BlocProvider(
        create: (context) => DeathsCubit(),
        child: BlocConsumer<DeathsCubit, DeathsState>(
          listener: (context, state){
            if(state is AllDeathsSuccessState){
              showCustomDeathsDialog(context, state.allDeathsModel);
            }
          },
          builder: (context, state){
            return MaterialButton(
              onPressed: () {
                DeathsCubit.get(context).allDeaths();
              },
              splashColor: Colors.transparent,
              child: const ListTile(
                leading: Icon(Iconsax.square, color: thirdColor),
                title: Text(
                  "الوفيات",
                  style: TextStyle(
                    fontSize:  18,
                    color: thirdColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
