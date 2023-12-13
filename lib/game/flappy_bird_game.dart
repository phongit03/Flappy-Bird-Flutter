import 'dart:async';
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappybird/components/background.dart';
import 'package:flappybird/components/bird.dart';
import 'package:flappybird/components/clouds.dart';
import 'package:flappybird/components/ground.dart';
import 'package:flappybird/components/pipe_group.dart';
import 'package:flutter/material.dart';

import '../config/configuration.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection{
  FlappyBirdGame();
  late Bird bird;
  bool isHit = false;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  late TextComponent score;
  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore()
      ]
    );
    interval.onTick = () => add(PipeGroup());
    add(Clouds());
  }
  TextComponent buildScore() {
    return TextComponent(
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,
          fontFamily: "Game",
          fontWeight: FontWeight.bold
        )
      )
    );
  }
  @override
  void onTap() {
    // TODO: implement onTap
    super.onTap();
    bird.fly();
  }
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    interval.update(dt);
    score.text = "${bird.score}";
  }
}