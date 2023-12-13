import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappybird/config/configuration.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flappybird/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../assets/assets.dart';

class Ground extends ParallaxComponent<FlappyBirdGame> with HasGameRef<FlappyBirdGame> {
    @override
  Future<void> onLoad() async {
    // TODO: implement onLoad
    final ground = await Flame.images.load(Assets.ground);
    size = Vector2(200,Config.groundHeight);
    parallax = Parallax([
      ParallaxLayer(
       ParallaxImage(ground, fill: LayerFill.none),
      ),
    ]);
    add(RectangleHitbox(
      position: Vector2(x, gameRef.size.y - Config.groundHeight),
      size: Vector2(gameRef.size.x, Config.groundHeight)
    ));
  }
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}