import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappybird/game/flappy_bird_game.dart';

import '../assets/assets.dart';
import '../config/configuration.dart';

class Clouds extends ParallaxComponent<FlappyBirdGame> with HasGameRef<FlappyBirdGame>{
  Clouds();
  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad
    final clouds = await Flame.images.load(Assets.clouds);
    position= Vector2(x, -(gameRef.size.y - Config.groundHeight));
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(clouds, fill: LayerFill.none),
      ),
    ]);
    add(RectangleHitbox(
        position: Vector2(x, gameRef.size.y - Config.groundHeight),
        size: Vector2(gameRef.size.x, Config.groundHeight/2)
    ));
  }
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}