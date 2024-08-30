import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/bloc_observer.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';
import 'package:hospital_management_system/core/network/remote/dio_helper.dart';
import 'package:hospital_management_system/features/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  // int? theme = CacheHelper.getData(key: "Theme");
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

  // final int themeIndex ;
  // final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //     providers:
    //     [
    //       // BlocProvider(create: (context) => HomeCubit()),
    //       // BlocProvider(create: (context) => AppCubit()..changeTheme(themeIndex)),
    //       // BlocProvider(create: (context) => TourismCubit()),
    //     ],
        return MaterialApp(
          theme: ThemeData(
            fontFamily: 'Ubuntu',
          ),
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
    );
  }
}

