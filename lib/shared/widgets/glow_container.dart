import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

class GlowContainer extends StatelessWidget {
  final Widget child;
  final Color glowColor;
  final double blurRadius;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const GlowContainer({
    super.key,
    required this.child,
    this.glowColor = AppColors.purpleGlow,
    this.blurRadius = 20,
    this.borderRadius = AppSizes.radiusLg,
    this.padding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: glowColor,
            blurRadius: blurRadius,
            spreadRadius: 0,
          ),
        ],
        border: Border.all(
          color: glowColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: child,
    );
  }
}
