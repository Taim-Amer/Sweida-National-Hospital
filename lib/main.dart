import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/bloc_observer.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/births/cubit/births_cubit.dart';
import 'package:hospital_management_system/features/deaths/cubit/deaths_cubit.dart';
import 'package:hospital_management_system/features/departments/cubit/departments_cubit.dart';
import 'package:hospital_management_system/features/equipment_store_keeper/cubit/equipment_store_keeper_cubit.dart';
import 'package:hospital_management_system/features/human_resources/cubit/human_resources_cubit.dart';
import 'package:hospital_management_system/features/login/views/login_screen.dart';
import 'package:hospital_management_system/features/medical_store_keeper/cubit/medical_store_keeper_cubit.dart';
import 'package:hospital_management_system/features/patients/cubit/patients_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  String? token = CacheHelper.getData(key: "token");
  print(token);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PatientsCubit()),
        BlocProvider(create: (context) => DeathsCubit()),
        BlocProvider(create: (context) => BirthsCubit()),
        BlocProvider(create: (context) => MedicalStoreKeeperCubit()),
        BlocProvider(create: (context) => EquipmentStoreKeeperCubit()),
        BlocProvider(create: (context) => HumanResourcesCubit()),
        BlocProvider(create: (context) => DepartmentsCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Ubuntu',
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}

