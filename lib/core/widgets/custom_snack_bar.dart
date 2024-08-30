import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/widgets/text_items.dart';

class CustomSnackBarWidget extends StatelessWidget {
  final String message;

  const CustomSnackBarWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: detailsText(message)),
      );
    });
    return const SizedBox();
  }

  void showSnackBar(BuildContext context, String message) {
    CustomSnackBarWidget(message: message);
  }
}
