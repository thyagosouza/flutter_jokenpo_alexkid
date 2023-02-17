import 'dart:async';

import 'package:flutter/material.dart';

import 'jokenpo_page.dart';
import 'splash_animation.dart';

import 'package:audioplayers/audioplayers.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AudioPlayer player = AudioPlayer();
  bool title = false;
  bool seq01 = true;
  bool seq02 = true;
  bool seq03 = true;
  bool seq04 = true;
  bool seq05 = true;
  bool seq06 = true;

  @override
  void initState() {
    setState(() {
         player.play(AssetSource('sounds/title_screen.mp3'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        seq01 = false;
      });
    });
    Future.delayed(const Duration(milliseconds: 1400), () {
      setState(() {
        seq02 = false;
      });
    });
    Future.delayed(const Duration(milliseconds: 2100), () {
      setState(() {
        seq03 = false;
      });
    });
    Future.delayed(const Duration(milliseconds: 2800), () {
      setState(() {
        seq04 = false;
      });
    });
    Future.delayed(const Duration(milliseconds: 3500), () {
      setState(() {
        seq05 = false;
      });
    });
    Future.delayed(const Duration(milliseconds: 4200), () {
      setState(() {
        seq06 = false;
      });
    });
    Future.delayed(const Duration(milliseconds: 4900), () {
      setState(() {
        title = true;
      });
    });
    final Color maskColor = Color(0xFFFFFFAC);
    var titleAnimation = SplashAnimation();
    return Scaffold(
      body: Container(
        color: maskColor,
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Center(
              child: Container(
                  width: double.maxFinite,
                  //height: 300,
                  child: Image.asset(
                    'assets/images/app/splash_page/title_complete.png',
                    fit: BoxFit.cover,
                  )),
            ),
            Visibility(
              visible: title,
              child: Container(
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.only(top: 250.0),
                  child: titleAnimation,
                ),
              ),
            ),
            Visibility(
              visible: seq03,
              child: Padding(
                padding: const EdgeInsets.only(top: 260),
                child: Container(
                  color: maskColor,
                  width: 70,
                  height: 90,
                ),
              ),
            ),
            Visibility(
              visible: seq05,
              child: Padding(
                padding: const EdgeInsets.only(top: 360),
                child: Container(
                  color: maskColor,
                  width: 140,
                  height: 200,
                ),
              ),
            ),
            Visibility(
              visible: seq02,
              child: Padding(
                padding: const EdgeInsets.only(top: 435, left: 145),
                child: Container(
                  color: maskColor,
                  width: 170,
                  height: 60,
                ),
              ),
            ),
            Visibility(
              visible: seq06,
              child: Padding(
                padding: const EdgeInsets.only(top: 500, left: 145),
                child: Container(
                  color: maskColor,
                  width: 230,
                  height: 60,
                ),
              ),
            ),
            Visibility(
              visible: seq01,
              child: Padding(
                padding: const EdgeInsets.only(top: 250, left: 250),
                child: Container(
                  color: maskColor,
                  width: 140,
                  height: 80,
                ),
              ),
            ),
            Visibility(
              visible: seq04,
              child: Padding(
                padding: const EdgeInsets.only(top: 340, left: 320),
                child: Container(
                  color: maskColor,
                  width: 80,
                  height: 150,
                ),
              ),
            ),
            Visibility(
              visible: title,
              child: Padding(
                padding: const EdgeInsets.only(top: 600, left: 105),
                child: Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const JokenpoPage()),
                      );
                    },
                    child: Text(
                      'START',
                      style: TextStyle(fontFamily: 'AlexKidd'),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
