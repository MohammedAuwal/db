import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? borderRadius;
  final Border? border;
  final VoidCallback? onTap;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.borderRadius,
    this.border,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ??
            const EdgeInsets.all(AppSizes.cardPadding),
        decoration: BoxDecoration(
          color: color ?? AppColors.surface,
          borderRadius:
              BorderRadius.circular(borderRadius ?? AppSizes.radiusLg),
          border: border ??
              Border.all(color: AppColors.glassBorder, width: 1),
        ),
        child: child,
      ),
    );
  }
}
