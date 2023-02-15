// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  final int millSeconds;
  final String path;
  const AnimationWidget({
    super.key,
    required this.millSeconds,
    required this.path,
  });

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<int>? _animation;
  Timer? timer;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.millSeconds))
      ..repeat();
    _animation = IntTween(begin: 1, end: 2).animate(_controller!);
    super.initState();
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
          'assets/images/app/${widget.path}0${frame}_trans.png',
          gaplessPlayback: true,
        );
      },
    );
  }
}
