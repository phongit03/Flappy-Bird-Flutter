


import 'package:flame/game.dart';
import 'package:flappybird/screens/game_over_screen.dart';
import 'package:flappybird/screens/main_menu_screen.dart';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'game/flappy_bird_game.dart';
var logger = Logger();
void main() {
  final game = FlappyBirdGame();
  runApp(
      GameWidget(
          game: game,
          initialActiveOverlays: const [MainMenuScreen.id],
          overlayBuilderMap: {
            "mainMenu": (context,_) => MainMenuScreen(game: game,),
            "gameOver": (context,_) => GameOverScreen(game: game,)
          },
      ),
  );
}

class FlappyBirdApp extends StatelessWidget {
  const FlappyBirdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
