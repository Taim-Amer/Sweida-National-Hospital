import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/bloc_observer.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/drawer/views/drawer_layout.dart';
import 'package:hospital_management_system/features/login/views/login_screen.dart';
import 'package:hospital_management_system/features/patients/cubit/patients_cubit.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  String? token = CacheHelper.getData(key: "token");
  print(token);
  Widget? widget;

  runApp(MyApp(
    // themeIndex: theme ?? 0,
    // startWidget : LoginPage()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final Widget startWidget;

  @override
  Widget build(BuildContext context) {
        return BlocProvider(
          create: (context) => PatientsCubit(),
          child: MaterialApp(
            theme: ThemeData(
              fontFamily: 'Ubuntu',
            ),
            debugShowCheckedModeBanner: false,
            home: DrawerLayout(),
          ),
        );
  }
}

