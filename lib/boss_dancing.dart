import 'dart:async';

import 'package:flutter/material.dart';

class BossDancing extends StatefulWidget {
  const BossDancing({Key? key}) : super(key: key);

  @override
  State<BossDancing> createState() => _BossDancingState();
}

class _BossDancingState extends State<BossDancing>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<int>? _animation;
  Timer? timer;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..repeat();
    _animation = IntTween(begin: 1, end: 2).animate(_controller!);
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
          'assets/images/app/boss_01/boss_dancing/0${frame}_trans.png',
          gaplessPlayback: true,
        );
      },
    );
  }
}
