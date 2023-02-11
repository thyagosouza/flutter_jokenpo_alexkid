import 'package:flutter/material.dart';

class AlexKiddPreparando extends StatefulWidget {
  const AlexKiddPreparando({Key? key}) : super(key: key);

  @override
  State<AlexKiddPreparando> createState() => _AlexKiddPreparandoState();
}

class _AlexKiddPreparandoState extends State<AlexKiddPreparando>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<int>? _animation;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700))
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
          'assets/images/app/alex_kidd/preparando/0${frame}_trans.png',
          gaplessPlayback: true,
        );
      },
    );
  }
}
