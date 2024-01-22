import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:plasticdiver/constants.dart';
import 'package:plasticdiver/game/components/collect_button.dart';
import 'package:plasticdiver/game/components/components.dart';
import 'package:plasticdiver/game/dive_world.dart';

class DiveGame extends FlameGame<DiveWorld> with HasKeyboardHandlerComponents {
  // Value Notifiers
  final score = ValueNotifier(0);
  final diveDepth = ValueNotifier(0.0);
  final ValueNotifier<double> remainingTime = ValueNotifier(20.0);
  // Timer
  final countdown = Timer(0.1, autoStart: true, repeat: true);

  final ValueNotifier<double> remainingCollectTime = ValueNotifier(0.0);
  final remainingCollectTimeTimer = Timer(0.5, autoStart: false, repeat: true);

  Function(bool hasWon, int score) onGameOver;

  late Joystick joystick;
  late SpriteButtonComponent collectButton;
  late Background background;

  DiveGame({required this.onGameOver})
      : super(
          world: DiveWorld(),
          camera: CameraComponent.withFixedResolution(width: Constants.gameWidth, height: Constants.gameHeight),
        );

  @override
  FutureOr<void> onLoad() async {
    camera.backdrop.add(background = Background());
    camera.viewport.add(FpsTextComponent(position: Vector2(Constants.gameWidth - 20, 20), anchor: Anchor.topRight));
    camera.viewport.add(Hud(scoreNotifier: score, diveDepthNotifier: diveDepth, remainingTime: remainingTime));
    camera.viewport.add(joystick = Joystick());
    camera.viewport.add(collectButton = CollectButton());

    // Add callback to update score text
    countdown.onTick = () {
      remainingTime.value -= countdown.limit;
      if (remainingTime.value <= 0) {
        pauseEngine();
        // TODO, know if the player has won or not
        onGameOver(true, score.value);
      }
    };

    remainingCollectTimeTimer.onTick = () {
      remainingCollectTime.value -= remainingCollectTimeTimer.limit;
      if (remainingCollectTime.value <= 0) {
        remainingCollectTimeTimer.stop();
        remainingCollectTimeTimer.reset();
      }
    };

    return super.onLoad();
  }

  @override
  bool get debugMode => true;

  @override
  void update(double dt) {
    super.update(dt);
    countdown.update(dt);
  }

  void enableCollectButton(Garbage garbage) {
    print('enableCollectButton');

    // TODO change the sprite of the button
    collectButton.onPressed = () => world.diver.collectGarbage(garbage);
  }

  void disableCollectButton(Garbage garbage) {
    print('disableCollectButton');
    // TODO change the sprite of the button
    collectButton.onPressed = null;
  }

  startCollecting(Garbage garbage) {
    print('startCollecting: ${garbage.runtimeType} : ${garbage.collectionTimeInSeconds}');
    remainingCollectTime.value = garbage.collectionTimeInSeconds.toDouble();
    remainingCollectTimeTimer.start();
  }
}
