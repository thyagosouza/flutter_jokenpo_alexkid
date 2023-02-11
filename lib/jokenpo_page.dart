import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'alex_kidd_preparando.dart';
import 'animation_image.dart';
import 'boss_dancing.dart';
import 'boss_preparando.dart';

class JokenpoPage extends StatefulWidget {
  const JokenpoPage({Key? key}) : super(key: key);

  @override
  State<JokenpoPage> createState() => _JokenpoPageState();
}

class _JokenpoPageState extends State<JokenpoPage> {
  AudioPlayer player = AudioPlayer();
  var _cloudEmptyBoss =
      AssetImage('assets/images/app/cloud_result/cloud_result.png');
  var _cloudEmptyBossResult =
      AssetImage('assets/images/app/cloud_result/cloud_result_empty.png');
  var _cloudEmptyPlayer =
      AssetImage('assets/images/app/cloud_result/cloud_result.png');
  var _cloudEmptyPlayerResult =
      AssetImage('assets/images/app/cloud_result/cloud_result_empty.png');
  var _escolhaResultBoss = '';
  String _msgResultado = '';
  String _escolhaResult = '';
  //String _escolhaResultBoss = '';
  bool _jogoIniciado = false;
  bool _cloudBoss = false;
  bool _cloudBossResult = true;
  bool _cloudMsgResult = false;
  bool _isDancing = false;
  bool _isAnimation = true;
  bool _button1 = false;
  bool _button2 = false;
  bool _button3 = false;

  void _escolha(String escolhaJogador) {
    final escolha = ['pedra', 'papel', 'tesoura'];
    var num = Random().nextInt(3);
    var escolhaBot = escolha[num];

    //Exibir imagem escolhida pela maquina
    Timer(Duration(seconds: 10), () {
      switch (escolhaBot) {
        case "pedra":
          setState(
            () {
              //
              _cloudEmptyBossResult = AssetImage(
                  "assets/images/app/cloud_result/cloud_pedra_result.png");
              _escolhaResultBoss = 'pedra';
            },
          );
          break;

        case "papel":
          setState(() {
            _cloudEmptyBossResult = AssetImage(
                "assets/images/app/cloud_result/cloud_papel_result.png");
            _escolhaResultBoss = 'papel';
          });
          break;
        case "tesoura":
          setState(() {
            _cloudEmptyBossResult = AssetImage(
                "assets/images/app/cloud_result/cloud_tesoura_result.png");
            _escolhaResultBoss = 'tesoura';
          });
          break;
      }
    });

    //Condições para ver quem ganha

    setState(() {
      if ((escolhaJogador == 'pedra' && escolhaBot == 'tesoura') ||
          (escolhaJogador == 'tesoura' && escolhaBot == 'papel') ||
          (escolhaJogador == 'papel' && escolhaBot == 'pedra')) {
        Timer(Duration(seconds: 10), () {
          _cloudBossResult = true;
          _cloudMsgResult = true;
          _msgResultado = 'YOU WIN!';
          _isDancing = false;
        });
      } else if ((escolhaJogador == 'tesoura' && escolhaBot == 'pedra') ||
          (escolhaJogador == 'papel' && escolhaBot == 'tesoura') ||
          (escolhaJogador == 'pedra' && escolhaBot == 'papel')) {
        Timer(Duration(seconds: 10), () {
          _cloudBossResult = true;
          _cloudMsgResult = true;
          _msgResultado = "YOU LOSE!";
          _isDancing = false;
        });
      } else {
        Timer(Duration(seconds: 10), () {
          _cloudBossResult = true;
          _cloudMsgResult = true;
          _msgResultado = "DRAW!";
          _isDancing = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var _alexKiddDancing = AlexKiddDancing();
    var _alexKiddPreparando = AlexKiddPreparando();
    var _bossDancing = BossDancing();
    var _bossPreparando = BossPreparando();
    return Scaffold(
      body: Container(
        color: Colors.amber,
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/app/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Visibility(
              visible: !_jogoIniciado,
              child: Container(
                alignment: Alignment(-0.75, 0.24),
                child: Image.asset(
                  'assets/images/app/alex_kidd/dancing/02_trans.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Visibility(
              visible: _isDancing,
              child: Padding(
                padding: const EdgeInsets.only(top: 442, left: 37),
                child: Container(
                  height: 90,
                  width: 90,
                  alignment: Alignment(-0.75, 0.24),
                  child: _isAnimation == true
                      ? _alexKiddDancing
                      : _alexKiddPreparando,
                ),
              ),
            ),
            Visibility(
              visible: _cloudMsgResult,
              child: Container(
                alignment: Alignment(-0.74, 0.26),
                child: Image.asset(
                  'assets/images/app/alex_kidd/result/${_escolhaResult}_trans.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Visibility(
              visible: _cloudMsgResult,
              child: Padding(
                padding: const EdgeInsets.only(top: 0, left: 253),
                child: Container(
                  alignment: Alignment(-0.74, 0.225),
                  child: Image.asset(
                    'assets/images/app/boss_01/boss_resultado/${_escolhaResultBoss}_trans.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !_jogoIniciado,
              child: Container(
                alignment: Alignment(0.79, 0.225),
                child: Image.asset(
                  'assets/images/app/boss_01/boss_dancing/02_trans.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Visibility(
              visible: _isDancing,
              child: Padding(
                padding: const EdgeInsets.only(top: 0, left: 40),
                child: Container(
                  alignment: Alignment(0.75, 0.225),
                  child: _isAnimation == true
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: _bossDancing,
                        )
                      : _bossPreparando,
                ),
              ),
            ),
            /*
            Container(
              alignment: Alignment(0.79, 0.225),
              child: Image.asset(
                'assets/images/app/boss_01/boss_dancing/02_trans.png',
                fit: BoxFit.cover,
              ),
            ),*/

            Visibility(
              visible: _cloudBoss,
              child: Container(
                alignment: Alignment(0.79, -0.2),
                child: Image(
                  image: _cloudEmptyBoss,
                ),
              ),
            ),
            Visibility(
              visible: _cloudBossResult,
              child: Container(
                alignment: Alignment(0.70, -0.19),
                child: Image(
                  image: _cloudEmptyBossResult,
                ),
              ),
            ),
            Container(
              alignment: Alignment(-0.75, -0.2),
              child: Image(
                image: _cloudEmptyPlayer,
              ),
            ),
            Visibility(
              visible: _cloudBoss,
              child: Container(
                alignment: Alignment(-0.67, -0.2),
                child: Image(
                  image: _cloudEmptyPlayerResult,
                ),
              ),
            ),
            Visibility(
              visible: _cloudMsgResult,
              child: Padding(
                padding: const EdgeInsets.only(top: 200, left: 70),
                child: Container(
                  // alignment: Alignment(0, 0.5),
                  color: Colors.black,
                  width: 250,
                  height: 50,
                  child: Center(
                    child: Text(
                      _msgResultado,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'AlexKidd'),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment(0, 0.9),
              child: AbsorbPointer(
                absorbing: _jogoIniciado,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _button1 = true;
                        // player.audioCache('sounds/sound_jokenpo.mp3');
                        playerSound();
                        _escolha('pedra');

                        _isDancing = true;
                        _escolhaResult = 'pedra';
                        _jogoIniciado = true;
                        _cloudBoss = true;
                        _cloudEmptyPlayerResult = AssetImage(
                            'assets/images/app/cloud_result/cloud_pedra_result.png');
                        _isAnimation = true;
                        animationFalse();

                        fimJogoIniciado();
                      },
                      child: _button2 || _button3 == true
                          ? Opacity(
                              opacity: 0.4,
                              child: Image.asset(
                                'assets/images/rock.png',
                              ),
                            )
                          : Image.asset(
                              'assets/images/rock.png',
                              width: 100,
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _button2 = true;
                        playerSound();
                        _escolha('papel');
                        _isDancing = true;
                        _escolhaResult = 'papel';
                        _jogoIniciado = true;
                        _cloudBoss = true;
                        _cloudEmptyPlayerResult = AssetImage(
                            'assets/images/app/cloud_result/cloud_papel_result.png');
                        _isAnimation = true;
                        animationFalse();
                        fimJogoIniciado();
                      },
                      child: _button1 || _button3 == true
                          ? Opacity(
                              opacity: 0.4,
                              child: Image.asset(
                                'assets/images/paper.png',
                              ),
                            )
                          : Image.asset(
                              'assets/images/paper.png',
                              width: 100,
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _button3 = true;
                        playerSound();
                        _escolha('tesoura');
                        _jogoIniciado = true;
                        _escolhaResult = 'tesoura';
                        _isDancing = true;
                        _cloudBoss = true;
                        _cloudEmptyPlayerResult = AssetImage(
                            'assets/images/app/cloud_result/cloud_tesoura_result.png');
                        _isAnimation = true;
                        animationFalse();
                        fimJogoIniciado();
                      },
                      child: _button1 || _button2 == true
                          ? Opacity(
                              opacity: 0.4,
                              child: Image.asset(
                                'assets/images/scissor.png',
                              ),
                            )
                          : Image.asset(
                              'assets/images/scissor.png',
                              width: 100,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void playerSound() {
    player.play(AssetSource('sounds/sound_jokenpo.mp3'));
  }

  void animationFalse() {
    Future.delayed(Duration(milliseconds: 8400), () {
      setState(() {
        _isAnimation = false;
      });
    });
  }

  void fimJogoIniciado() {
    Timer(Duration(seconds: 15), () {
      setState(() {
        _button1 = false;
        _button2 = false;
        _button3 = false;
        _jogoIniciado = false;
        _cloudBoss = false;
        _cloudBossResult = false;
        _cloudMsgResult = false;
        _isDancing = false;
        _isAnimation = false;
        _cloudEmptyBoss =
            AssetImage('assets/images/app/cloud_result/cloud_result.png');
        _cloudEmptyPlayer =
            AssetImage('assets/images/app/cloud_result/cloud_result.png');
        _msgResultado = '';
      });
    });
  }
}
