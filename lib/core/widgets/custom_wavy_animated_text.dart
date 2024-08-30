import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';

class CustomWavyAnimatedText extends StatelessWidget {
  const CustomWavyAnimatedText({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        color: titleColor,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText(text),
        ],
        repeatForever: true,
        isRepeatingAnimation: true,
      ),
    );
  }
}


