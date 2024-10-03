import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/features/births/views/births_screen.dart';
import 'package:hospital_management_system/features/deaths/views/deaths_screen.dart';
import 'package:hospital_management_system/features/home/home_screen.dart';
import 'package:hospital_management_system/features/login/views/widgets/login_body_widget.dart';
import 'package:hospital_management_system/features/surgery/views/surgery_screen.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());

  static DrawerCubit get(context) => BlocProvider.of(context);
  int? departmentID = int.tryParse(LoginBodyWidget.departmentController.text);

  int? selectedIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const SurgeryScreen(),
    const DeathsScreen(),
    const BirthsScreen()
  ];

  void changeIndex(index){
    selectedIndex = index;
    emit(ChangeDrawerIndexState());
  }
}
