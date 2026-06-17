import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

class TypingAnimation extends StatefulWidget {
  final List<String> texts;
  final TextStyle? style;
  final Duration typingSpeed;
  final Duration pauseDuration;

  const TypingAnimation({
    super.key,
    required this.texts,
    this.style,
    this.typingSpeed = const Duration(milliseconds: 80),
    this.pauseDuration = const Duration(seconds: 2),
  });

  @override
  State<TypingAnimation> createState() => _TypingAnimationState();
}

class _TypingAnimationState extends State<TypingAnimation> {
  String _displayText = '';
  int _textIndex = 0;
  int _charIndex = 0;
  bool _isTyping = true;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  Future<void> _startTyping() async {
    while (mounted) {
      if (_isTyping) {
        if (_charIndex < widget.texts[_textIndex].length) {
          await Future.delayed(widget.typingSpeed);
          if (mounted) {
            setState(() {
              _displayText =
                  widget.texts[_textIndex].substring(0, _charIndex + 1);
              _charIndex++;
            });
          }
        } else {
          _isTyping = false;
          await Future.delayed(widget.pauseDuration);
        }
      } else {
        if (_charIndex > 0) {
          await Future.delayed(
              const Duration(milliseconds: 40));
          if (mounted) {
            setState(() {
              _charIndex--;
              _displayText =
                  widget.texts[_textIndex].substring(0, _charIndex);
            });
          }
        } else {
          _textIndex = (_textIndex + 1) % widget.texts.length;
          _isTyping = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _displayText,
          style: widget.style ??
              const TextStyle(
                fontFamily: 'Inter',
                fontSize: AppSizes.fontMd,
                color: AppColors.textSecondary,
              ),
        ),
        AnimatedOpacity(
          opacity: _isTyping ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: Container(
            width: 2,
            height: 18,
            color: AppColors.accent,
          ),
        ),
      ],
    );
  }
}
