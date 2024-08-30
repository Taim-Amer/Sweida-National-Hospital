// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class CustomFloatingAction extends StatelessWidget {
  CustomFloatingAction({super.key, required this.color1, required this.color2 , this.function , this.icon = Icons.arrow_forward_ios});

  final Color color1;
  final Color color2;
  Function? function;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: color1.withOpacity(.8),
      onPressed: ()
      {
        function!();
      },
      child: Icon(
        color: color2,
        icon,
      ),
    );
  }
}
