import 'dart:async';
import 'package:flutter/material.dart';

class MarqueeText extends StatefulWidget {
  final String text;
  final double speed; // pixel per second
  final TextStyle? style;

  const MarqueeText({
    super.key,
    required this.text,
    this.speed = 40,
    this.style,
  });

  @override
  State<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: -1.0,
    ).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          return FractionalTranslation(
            translation: Offset(_animation.value, 0),
            child: child,
          );
        },
        child: Text(
          widget.text,
          style: widget.style ??
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
