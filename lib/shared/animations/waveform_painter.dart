import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class WaveformPainter extends CustomPainter {
  final double animationValue;
  final Color color;
  final int barCount;

  WaveformPainter({
    required this.animationValue,
    this.color = AppColors.primary,
    this.barCount = 20,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final barWidth = size.width / (barCount * 2);
    final centerY = size.height / 2;

    for (int i = 0; i < barCount; i++) {
      final x = i * (barWidth * 2) + barWidth;
      final phase = (animationValue * 2 * pi) + (i * pi / barCount);
      final amplitude = (sin(phase) * 0.5 + 0.5) * (size.height * 0.4) + 4;

      canvas.drawLine(
        Offset(x, centerY - amplitude),
        Offset(x, centerY + amplitude),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(WaveformPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}

class AnimatedWaveform extends StatefulWidget {
  final double height;
  final Color color;
  final int barCount;

  const AnimatedWaveform({
    super.key,
    this.height = 40,
    this.color = AppColors.primary,
    this.barCount = 12,
  });

  @override
  State<AnimatedWaveform> createState() => _AnimatedWaveformState();
}

class _AnimatedWaveformState extends State<AnimatedWaveform>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
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
          size: Size(double.infinity, widget.height),
          painter: WaveformPainter(
            animationValue: _controller.value,
            color: widget.color,
            barCount: widget.barCount,
          ),
        );
      },
    );
  }
}
