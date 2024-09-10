import 'package:flutter/material.dart';

void navigateTo(context , widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context , widget) => Navigator.pushAndRemoveUntil(
  context ,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (Route<dynamic> route) => false,
);

void navigateWithSlideFromRight(context, Widget widget, {Curve curve = Curves.easeIn}) {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => SlideTransition(
        position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(animation),
        child: widget,
      ),
    ),
  );
}

void navigateWithFade(context, Widget widget, {Curve curve = Curves.easeIn}) {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 900),
      pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
        child: widget,
      ),
    ),
  );
}

void navigateWithFadeAndFinish(context, Widget widget, {Curve curve = Curves.easeIn}) {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
        child: widget,
      ),
    ),
  );
}

void navigateWithSlideFromLeft(context, Widget widget, {Curve curve = Curves.easeIn}) {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(animation),
        child: widget,
      ),
    ),
  );
}

void navigateWithSlideFromTop(context, Widget widget, {Curve curve = Curves.easeIn}) {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero).animate(animation),
        child: widget,
      ),
    ),
  );
}

void navigateWithSlideFromBottom(context, Widget widget, {Curve curve = Curves.easeIn}) {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(animation),
        child: widget,
      ),
    ),
  );
}

void navigateWithSlideFromRightAndFinish(context, Widget widget, {Curve curve = Curves.easeIn}) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => SlideTransition(
        position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(animation),
        child: widget,
      ),
    ),
        (Route<dynamic> route) => false, // Prevent popping back
  );
}

void navigateWithSlideFromLeftAndFinish(context, Widget widget, {Curve curve = Curves.easeIn}) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(animation),
        child: widget,
      ),
    ),
        (Route<dynamic> route) => false, // Prevent popping back
  );
}

void navigateWithSlideFromTopAndFinish(context, Widget widget, {Curve curve = Curves.easeIn}) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero).animate(animation),
        child: widget,
      ),
    ),
        (Route<dynamic> route) => false, // Prevent popping back
  );
}

void navigateWithSlideFromBottomAndFinish(context, Widget widget, {Curve curve = Curves.easeIn}) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(animation),
        child: widget,
      ),
    ),
        (Route<dynamic> route) => false, // Prevent popping back
  );
}



