import 'dart:ui';

import 'package:flutter/material.dart';

class LoginImageWidget extends StatelessWidget {
  const LoginImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
              child: Image.asset(
                'assets/images/login_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(.5),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              'Sweida National Hospital',
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}