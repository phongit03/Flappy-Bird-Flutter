import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

import '../assets/assets.dart';
import '../config/configuration.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame> , CollisionCallbacks{
  Bird();

  int score = 0;

  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad
    final birdMoveUp = await gameRef.loadSprite(Assets.birdUp);
    final birdMoveMid = await gameRef.loadSprite(Assets.birdMid);
    final birdMoveDown = await gameRef.loadSprite(Assets.birdDown);
    size = Vector2(50, 40);
    position = Vector2(100, gameRef.size.y/2 - size.y / 2);
    current = BirdMovement.middle;
    sprites ={
      BirdMovement.up: birdMoveUp,
      BirdMovement.middle: birdMoveMid,
      BirdMovement.down: birdMoveDown
    };
    add(CircleHitbox());
  }

  void fly() {
    Config.birdVelocity = 210;
    add(
      MoveByEffect(
          Vector2(0, Config.gravity),
          EffectController(duration: 0.3, curve: Curves.decelerate),
          onComplete: () => current = BirdMovement.down
      ),
    );
    current = BirdMovement.up;
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    Config.birdVelocity += 8;
    position.y += Config.birdVelocity * dt;
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }

  void gameOver() {
    game.isHit = true;
    gameRef.overlays.add("gameOver");
    gameRef.pauseEngine();
  }

  void resetGame() {
    position = Vector2(100, gameRef.size.y / 2 - size.y / 2);
    current = BirdMovement.middle;
    Config.birdVelocity = 210;
    score = 0;
  }
}

enum BirdMovement {
  up, middle, down
}
