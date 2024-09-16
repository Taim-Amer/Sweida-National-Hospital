import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/features/departments/views/department_screen.dart';
import 'package:hospital_management_system/features/home/home_screen.dart';
import 'package:hospital_management_system/features/surgery/views/surgery_screen.dart';
part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());

  static DrawerCubit get(context) => BlocProvider.of(context);

  int? selectedIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    SurgeryScreen(),
    TestScreen(),
    Scaffold(body: Container(color: Colors.orangeAccent)),
    Scaffold(body: Container(color: Colors.pinkAccent)),
    Scaffold(body: Container(color: Colors.amberAccent)),
  ];

  void changeIndex(index){
    selectedIndex = index;
    emit(ChangeDrawerIndexState());
  }
}
