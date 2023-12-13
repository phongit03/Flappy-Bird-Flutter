import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappybird/components/pipe.dart';
import 'package:flappybird/config/configuration.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flutter/cupertino.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();
  final _random = Random();
  @override
  Future<void> onLoad() async{
    // TODO: implement onLoad
    position.x = gameRef.size.x;
    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY =
        spacing + _random.nextDouble() * (heightMinusGround - spacing);
    addAll([
      Pipe(pipePosition: PipePosition.top, height: centerY - spacing / 2),
      Pipe(pipePosition: PipePosition.bottom, height: heightMinusGround - (centerY + spacing / 2))
    ]);
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if(position.x <= -10) {
      removeFromParent();
      updateScore();
    }

    if(game.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }

  }

  void updateScore() {
    game.bird.score += 1;
  }
}