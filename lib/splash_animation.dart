import 'dart:async';

import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({Key? key}) : super(key: key);

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<int>? _animation;
  Timer? timer;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400))
      ..repeat();
    _animation = IntTween(begin: 1, end: 3).animate(_controller!);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation!,
      builder: (context, child) {
        String frame = _animation!.value.toString().padLeft(1, '1');
        return Image.asset(
          'assets/images/app/splash_page/title_$frame.png',
          gaplessPlayback: true,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
