import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/features/drawer/cubit/drawer_cubit.dart';

class CustomDrawerMenuItem extends StatelessWidget {
  const CustomDrawerMenuItem({super.key, required this.index, required this.icon, required this.title});

  final int index;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state){
        var cubit = DrawerCubit.get(context);
        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
              color: cubit.selectedIndex == index ? defaultLightColor : Colors.transparent,
              borderRadius: BorderRadius.circular(20)
          ),
          child: ListTile(
            leading: AnimatedOpacity(
              opacity: cubit.selectedIndex == index ? 1.0 : 0.6,
              duration: const Duration(milliseconds: 100),
              child: Icon(
                icon,
                color: cubit.selectedIndex == index ? thirdColor : titleColor,
              ),
            ),
            title: TweenAnimationBuilder(
              tween: Tween<double>(begin: 16.0, end: cubit.selectedIndex == index ? 18.0 : 16.0),
              duration: const Duration(milliseconds: 100),
              builder: (context, size, child) {
                return Text(
                  title,
                  style: TextStyle(
                    fontSize: size,
                    color: cubit.selectedIndex == index ? thirdColor : titleColor,
                  ),
                );
              },
            ),
            selected: cubit.selectedIndex == index,
            onTap: () => cubit.changeIndex(index),
          ),
        );
      },
    );
  }
}
