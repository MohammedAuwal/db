import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

class GradientButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final List<Color> colors;
  final double height;
  final double? width;
  final Widget? prefix;
  final bool isLoading;

  const GradientButton({
    super.key,
    required this.label,
    this.onTap,
    this.colors = AppColors.primaryGradient,
    this.height = AppSizes.btnMd,
    this.width,
    this.prefix,
    this.isLoading = false,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap?.call();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: AppSizes.animFast),
        child: Container(
          height: widget.height,
          width: widget.width ?? double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.onTap == null
                  ? [Colors.grey.shade700, Colors.grey.shade600]
                  : widget.colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            boxShadow: widget.onTap == null
                ? []
                : [
                    BoxShadow(
                      color: AppColors.purpleGlow,
                      blurRadius: 12,
                      spreadRadius: 0,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Center(
            child: widget.isLoading
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.prefix != null) ...[
                        widget.prefix!,
                        const SizedBox(width: AppSizes.sm),
                      ],
                      Text(
                        widget.label,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: AppSizes.fontLg,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
