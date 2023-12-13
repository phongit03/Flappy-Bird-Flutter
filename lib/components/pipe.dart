import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flappybird/main.dart';

import '../assets/assets.dart';
import '../config/configuration.dart';


class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe({
    required this.pipePosition,
    required this.height
  });
  @override
  final double height;
  final PipePosition pipePosition;

  @override
  Future<void> onLoad() async{
    // TODO: implement onLoad
    final pipe = await Flame.images.load(Assets.pipe);
    final rotatedPipe = await Flame.images.load(Assets.rotatedPipe);
    size = Vector2(50, height);

    switch(pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite= Sprite(rotatedPipe);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
      default:
    }

    add(RectangleHitbox());
  }
}

enum PipePosition {
  top, bottom
}
