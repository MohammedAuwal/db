import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class SplashWaveformAnimation extends StatefulWidget {
  const SplashWaveformAnimation({super.key});

  @override
  State<SplashWaveformAnimation> createState() =>
      _SplashWaveformAnimationState();
}

class _SplashWaveformAnimationState extends State<SplashWaveformAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          size: const Size(180, 48),
          painter: _WaveformBarPainter(
            animValue: _controller.value,
          ),
        );
      },
    );
  }
}

class _WaveformBarPainter extends CustomPainter {
  final double animValue;
  static const int barCount = 18;

  const _WaveformBarPainter({required this.animValue});

  @override
  void paint(Canvas canvas, Size size) {
    final barWidth = size.width / (barCount * 2);
    final centerY = size.height / 2;

    for (int i = 0; i < barCount; i++) {
      final phase = (animValue * 2 * pi) + (i * pi / barCount * 2);
      final amplitude =
          (sin(phase) * 0.5 + 0.5) * (size.height * 0.45) + 4;

      final progress = i / barCount;
      final Color barColor = Color.lerp(
        AppColors.primary,
        AppColors.accent,
        progress,
      )!;

      final paint = Paint()
        ..color = barColor
        ..strokeWidth = barWidth * 0.85
        ..strokeCap = StrokeCap.round;

      final x = i * (barWidth * 2) + barWidth;

      canvas.drawLine(
        Offset(x, centerY - amplitude),
        Offset(x, centerY + amplitude),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_WaveformBarPainter old) =>
      old.animValue != animValue;
}
