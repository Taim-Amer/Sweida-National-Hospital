// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hospital_management_system/core/styles/themes.dart';
//
// part 'theme_state.dart';
//
// class ThemeCubit extends Cubit<ThemeState> {
//   ThemeCubit() : super(ThemeInitial());
//
//   static ThemeCubit get(context) => BlocProvider.of(context);
//
//   int themeIndex = 0 ;
//   int loadingCounter = 0;
//   void changeTheme(int themeIndex){
//
//     emit(LoadingChangeThemeState());
//     setTheme(themeIndex);
//     getDefaultColor();
//     getSecondColor();
//
//     loadingCounter++;
//     if(loadingCounter >= 2){
//       emit(SuccessChangeThemeState());
//     }
//   }
// }
