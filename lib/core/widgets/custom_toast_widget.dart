import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital_management_system/core/styles/colors.dart';

void showToast(String txt , ToastState state) =>  Fluttertoast.showToast(
    msg: txt,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: wightColor,
    fontSize: 16.0
);

enum ToastState{SUCCESS , ERROR , WARNING}

Color chooseToastColor(ToastState state) {
  Color color ;
  switch(state)
  {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.redAccent;
      break;
    case ToastState.WARNING:
      color = Colors.orange;
      break;
  }
  return color;
}