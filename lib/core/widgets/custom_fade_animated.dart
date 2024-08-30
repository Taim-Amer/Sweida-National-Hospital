import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:hospital_management_system/core/styles/colors.dart';

class CustomFadeAnimation extends StatelessWidget {
  const CustomFadeAnimation({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: titleColor
      ),
      child: AnimatedTextKit(
        repeatForever: true,
        isRepeatingAnimation: true,
        animatedTexts: [
          FadeAnimatedText(
            text,
            duration: const Duration(seconds: 5),
          ),
        ],
      ),
    );
  }
}
