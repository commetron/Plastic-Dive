import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/rendering.dart';
import 'package:plasticdiver/constants.dart';
import 'package:plasticdiver/game/dive_game.dart';

class Background extends ParallaxComponent<DiveGame> {
  Background()
      : super(
          anchor: Anchor.center,
          size: Vector2(Constants.gameWidth, Constants.gameHeight),
          position: Vector2(Constants.gameWidth / 2, Constants.gameHeight / 2),
        );

  @override
  Future<void> onLoad() async {
    parallax = await game.loadParallax(
      [
        ParallaxImageData('parallax/background.png'),
        ParallaxImageData('parallax/midground.png'),
      ],
      baseVelocity: Vector2
          .zero(), // If the player doesn't move, the background doesn't move
      velocityMultiplierDelta:
          Vector2(1.1, 1.1), // Speed between parallax layers
      repeat: ImageRepeat.repeat, // Repeat the background image for X and Y
    );
  }

  // Move the background when the player moves
  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity =
        game.world.diver.velocity * Constants.backgroundVelocityMultiplier;
  }
}
