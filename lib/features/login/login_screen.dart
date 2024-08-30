import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: silverColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(child: Text("taim"),),
    );
  }
}
