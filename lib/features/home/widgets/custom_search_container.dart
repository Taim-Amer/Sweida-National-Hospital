import 'package:flutter/material.dart';
import 'package:hospital_management_system/core/styles/colors.dart';
import 'package:hospital_management_system/core/styles/sizes.dart';
import 'package:iconsax/iconsax.dart';

class CustomSearchContainer extends StatelessWidget {
  const CustomSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: Sizes.defaultSpace)
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: 300,
          height: 60,
          padding: const EdgeInsets.all(Sizes.md),
          decoration: BoxDecoration(
              color: showBackground ? Colors.grey : Colors.transparent,
              borderRadius: BorderRadius.circular(Sizes.cardRadiusLg),
              border: showBorder ? Border.all(color: secondDarkColor) : null
          ),
          child: Row(
            children: [
              Icon(icon, color: secondDarkColor,),
              const SizedBox(width: Sizes.spaceBtwItems,),
              Text(text, style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ),
      ),
    );
  }
}