import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

import '../assets/assets.dart';
class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const id = "gameOver";
  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black26,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text (
              'Score: ${game.bird.score}',
              style: const TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontFamily: 'Game',
              ),
            ),
            Image.asset(Assets.gameOver),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text(
                'Restart',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );


  }

  void onRestart() {
    game.bird.resetGame();
    game.overlays.remove("gameOver");
    game.resumeEngine();
  }
}
