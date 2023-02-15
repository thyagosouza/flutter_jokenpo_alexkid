import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:jokenpo_alexkidd/core/ui/helpers/size_extensions.dart';
import 'package:jokenpo_alexkidd/widget/animation_widget.dart';

class JokenpoPage extends StatefulWidget {
  const JokenpoPage({Key? key}) : super(key: key);

  @override
  State<JokenpoPage> createState() => _JokenpoPageState();
}

class _JokenpoPageState extends State<JokenpoPage> {
  AudioPlayer player = AudioPlayer();
  final String pathImage = 'assets/images/app/';

  var _cloudEmptyBoss =
      const AssetImage('assets/images/app/cloud_result/cloud_result.png');
  var _cloudEmptyBossResult =
      const AssetImage('assets/images/app/cloud_result/cloud_result_empty.png');
  var _cloudEmptyPlayer =
      const AssetImage('assets/images/app/cloud_result/cloud_result.png');
  var _cloudEmptyPlayerResult =
      const AssetImage('assets/images/app/cloud_result/cloud_result_empty.png');
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
    Timer(const Duration(seconds: 10), () {
      switch (escolhaBot) {
        case "pedra":
          setState(
            () {
              //
              _cloudEmptyBossResult =
                  AssetImage("${pathImage}cloud_result/cloud_pedra_result.png");
              _escolhaResultBoss = 'pedra';
            },
          );
          break;

        case "papel":
          setState(() {
            _cloudEmptyBossResult =
                AssetImage("${pathImage}cloud_result/cloud_papel_result.png");
            _escolhaResultBoss = 'papel';
          });
          break;
        case "tesoura":
          setState(() {
            _cloudEmptyBossResult =
                AssetImage("${pathImage}cloud_result/cloud_tesoura_result.png");
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
        Timer(const Duration(seconds: 10), () {
          _cloudBossResult = true;
          _cloudMsgResult = true;
          _msgResultado = 'YOU WIN!';
          _isDancing = false;
        });
      } else if ((escolhaJogador == 'tesoura' && escolhaBot == 'pedra') ||
          (escolhaJogador == 'papel' && escolhaBot == 'tesoura') ||
          (escolhaJogador == 'pedra' && escolhaBot == 'papel')) {
        Timer(const Duration(seconds: 10), () {
          _cloudBossResult = true;
          _cloudMsgResult = true;
          _msgResultado = "YOU LOSE!";
          _isDancing = false;
        });
      } else {
        Timer(const Duration(seconds: 10), () {
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
    var alexKiddDancing =
        AnimationWidget(millSeconds: 800, path: 'alex_kidd/dancing/');
    var alexKiddPreparando =
        AnimationWidget(millSeconds: 300, path: 'alex_kidd/preparando/');
    var bossDancing =
        AnimationWidget(millSeconds: 800, path: 'boss_01/boss_dancing/');
    var bossPreparando =
        AnimationWidget(millSeconds: 700, path: 'boss_01/boss_preparando/');
    return Scaffold(
      body: Container(
        color: Colors.amber,
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.sWidth,
                child: Image.asset(
                  '${pathImage}background.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Visibility(
              visible: !_jogoIniciado,
              child: Container(
                alignment: Alignment(
                  context.percentWidth(-.0019),
                  context.percentHeight(.00030),
                ),
                child: Image.asset(
                  '${pathImage}alex_kidd/dancing/02_trans.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Visibility(
              visible: _isDancing,
              child: Container(
                alignment: Alignment(
                  context.percentWidth(-.0019),
                  context.percentHeight(.00030),
                ),
                child:
                    _isAnimation == true ? alexKiddDancing : alexKiddPreparando,
              ),
            ),
            Visibility(
              visible: _cloudMsgResult,
              child: Container(
                alignment: Alignment(
                  context.percentWidth(-.0019),
                  context.percentHeight(.000325),
                ),
                child: Image.asset(
                  '${pathImage}alex_kidd/result/${_escolhaResult}_trans.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Visibility(
              visible: !_jogoIniciado,
              child: Container(
                alignment: Alignment(
                  context.percentWidth(.0020),
                  context.percentHeight(.00028),
                ),
                child: Image.asset(
                  '${pathImage}boss_01/boss_dancing/02_trans.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Visibility(
              visible: _isDancing,
              child: Container(
                alignment: Alignment(
                  context.percentWidth(.0020),
                  context.percentHeight(.00028),
                ),
                child: _isAnimation == true ? bossDancing : bossPreparando,
              ),
            ),
            Visibility(
              visible: _cloudMsgResult,
              child: Container(
                alignment: Alignment(
                  context.percentWidth(.0019),
                  context.percentHeight(.00028),
                ),
                child: Image.asset(
                  '${pathImage}boss_01/boss_resultado/${_escolhaResultBoss}_trans.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            /*
            Container(
              alignment: Alignment(0.79, 0.225),
              child: Image.asset(
                '${pathImage}boss_01/boss_dancing/02_trans.png',
                fit: BoxFit.cover,
              ),
            ),*/

            Visibility(
              visible: _cloudBoss,
              child: Container(
                alignment: const Alignment(0.79, -0.2),
                child: Image(
                  image: _cloudEmptyBoss,
                ),
              ),
            ),
            Visibility(
              visible: _cloudBossResult,
              child: Container(
                alignment: const Alignment(0.70, -0.19),
                child: Image(
                  image: _cloudEmptyBossResult,
                ),
              ),
            ),
            Container(
              alignment: const Alignment(-0.75, -0.2),
              child: Image(
                image: _cloudEmptyPlayer,
              ),
            ),
            Visibility(
              visible: _cloudBoss,
              child: Container(
                alignment: const Alignment(-0.67, -0.2),
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
                      style: const TextStyle(
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
              alignment: const Alignment(0, 0.9),
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
                            '${pathImage}cloud_result/cloud_pedra_result.png');
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
                            '${pathImage}cloud_result/cloud_papel_result.png');
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
                            '${pathImage}cloud_result/cloud_tesoura_result.png');
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
    Future.delayed(const Duration(milliseconds: 8400), () {
      setState(() {
        _isAnimation = false;
      });
    });
  }

  void fimJogoIniciado() {
    Timer(const Duration(seconds: 15), () {
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
            AssetImage('${pathImage}cloud_result/cloud_result.png');
        _cloudEmptyPlayer =
            AssetImage('${pathImage}cloud_result/cloud_result.png');
        _msgResultado = '';
      });
    });
  }
}
