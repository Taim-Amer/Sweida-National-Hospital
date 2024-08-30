import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomStaggeredListAnimation extends StatelessWidget {
  CustomStaggeredListAnimation({super.key, required this.widgetBuilder, required this.count, this.isHorizontal = false, this.physics = const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics())});

  final Widget Function(int index) widgetBuilder;
  final int count;
  final bool isHorizontal;
  ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
        physics: physics,
        itemCount: count,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                child: widgetBuilder(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
