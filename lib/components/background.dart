import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flappybird/assets/assets.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Background();
  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}