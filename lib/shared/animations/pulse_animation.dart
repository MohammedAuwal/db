import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class PulseAnimation extends StatefulWidget {
  final Widget child;
  final Color glowColor;
  final double minScale;
  final double maxScale;
  final Duration duration;

  const PulseAnimation({
    super.key,
    required this.child,
    this.glowColor = AppColors.purpleGlow,
    this.minScale = 0.95,
    this.maxScale = 1.05,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<PulseAnimation> createState() => _PulseAnimationState();
}

class _PulseAnimationState extends State<PulseAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);

    _scale = Tween<double>(
      begin: widget.minScale,
      end: widget.maxScale,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: widget.child,
    );
  }
}
