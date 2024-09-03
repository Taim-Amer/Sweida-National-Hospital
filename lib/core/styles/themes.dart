// import 'package:flutter/material.dart';
// import 'package:hospital_management_system/core/network/local/cache_helper.dart';
// import 'package:hospital_management_system/core/styles/colors.dart';
//
// int? themeIndex ;
// Future<void> setTheme(int themeIndex) async{
//   switch(themeIndex){
//     case 0:
//       await CacheHelper.saveData(key: "Theme", value: 0);
//       break;
//   }
// }
//
// int getTheme(){
//   return CacheHelper.getData(key: "Theme");
// }
//
// Color defaultColor = defaultColor;
// Future<Color> getDefaultColor() async{
//   int themeIndex = await CacheHelper.getData(key: "Theme");
//   if(themeIndex == 0){
//     // defaultColor = defaultSkyColor;
//     defaultColor = Color(0xffC0C0C0);
//
//   }
//   return defaultColor;
// }
//
// Color secondColor = secondColor;
// Future<Color> getSecondColor() async{
//   secondColor ??= secondColor;
//   int themeIndex = await CacheHelper.getData(key: "Theme");
//   if(themeIndex == 0){
//     secondColor = secondColor;
//
//   }
//   return secondColor;
// }