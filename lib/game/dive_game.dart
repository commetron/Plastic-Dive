import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:plasticdiver/constants.dart';
import 'package:plasticdiver/game/components/components.dart';
import 'package:plasticdiver/game/dive_world.dart';

class DiveGame extends FlameGame<DiveWorld> with HasKeyboardHandlerComponents {
  // Debug
  @override
  bool get debugMode => false;

  // Value Notifiers
  final score = ValueNotifier(0);
  final diveDepth = ValueNotifier(0.0);
  bool hasDived = false;
  final ValueNotifier<double> remainingTime = ValueNotifier(20.0);

  // Timer
  final countdownTimer = Timer(0.1, autoStart: true, repeat: true);

  final ValueNotifier<double> remainingCollectTime = ValueNotifier(0.0);
  final remainingCollectTimeTimer = Timer(0.5, autoStart: false, repeat: true);

  Function(bool hasWon, int score) onGameOver;
  int airTankLevel;
  int swimmingSpeedLevel;
  int collectingSpeedLevel;
  int diveDepthLevel;
  int highScore; // TODO highlight score when it's a new high score
  bool isSoundEnabled;

  late Joystick joystick;
  late CollectButton collectButton;
  late Background background;

  late RectangleComponent darkenEffect;

  DiveGame({
    required this.onGameOver,
    required this.airTankLevel,
    required this.swimmingSpeedLevel,
    required this.collectingSpeedLevel,
    required this.diveDepthLevel,
    required this.highScore,
    required this.isSoundEnabled,
  }) : super(
          world: DiveWorld(worldDeepness: Constants.worldDeepness * (pow(diveDepthLevel, 2))),
          camera: CameraComponent.withFixedResolution(width: Constants.gameWidth, height: Constants.gameHeight),
        );

  @override
  FutureOr<void> onLoad() async {
    // Music
    if (isSoundEnabled) {
      FlameAudio.bgm.initialize();
      await FlameAudio.bgm.play('music/AtDepth-LishGrooves.mp3', volume: 0.5);
    }

    // Camera + viewport
    await camera.backdrop.add(background = Background());
    await camera.viewport.add(FpsTextComponent(position: Vector2(Constants.gameWidth - 20, 20), anchor: Anchor.topRight));
    await camera.viewport.add(Hud(scoreNotifier: score, diveDepthNotifier: diveDepth, remainingTime: remainingTime));
    await camera.viewport.add(joystick = Joystick());
    await camera.viewport.add(collectButton = CollectButton());

    // Darken the world as we go deeper
    await camera.viewport.add(
        darkenEffect = RectangleComponent(size: Vector2(Constants.gameWidth, Constants.gameHeight), paint: Paint()..color = const Color(0x00000000)));

    // Add callback to update score text
    countdownTimer.onTick = () {
      remainingTime.value -= countdownTimer.limit;
      if (remainingTime.value <= 0) {
        pauseEngine();

        if (isSoundEnabled) {
          FlameAudio.bgm.stop();
          // TODO ? FlameAudio.bgm.dispose();
          // TODO, know if the player has won or not
          FlameAudio.play('sfx/game-over.mp3');
        }

        // TODO FlameAudio.play('sfx/game-win.mp3');
        // Time is over -> player lost
        onGameOver(false, score.value);
      }
    };

    remainingCollectTimeTimer.onTick = () {
      remainingCollectTime.value -= remainingCollectTimeTimer.limit;
      if (remainingCollectTime.value <= 0) {
        remainingCollectTimeTimer.stop();
        remainingCollectTimeTimer.reset();
      }
    };

    diveDepth.addListener(() {
      if (!hasDived && diveDepth.value > 0.3) {
        hasDived = true;
      }

      if (hasDived && diveDepth.value <= 0.2) {
        onGameOver(true, score.value);
      }

      // Update the darken effect
      darkenEffect.paint = Paint()..color = Color.fromRGBO(0, 0, 0, diveDepth.value * 0.025);
    });

    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    countdownTimer.update(dt);
    remainingCollectTimeTimer.update(dt);
  }

  void enableCollectButton(Garbage garbage) {
    print('enableCollectButton');

    // Add keyboard press event
    collectButton.enable();
    collectButton.onPressed = () => world.diver.collectGarbage(garbage);
  }

  void disableCollectButton(Garbage garbage) {
    print('disableCollectButton');
    // TODO change the sprite of the button
    collectButton.disable();
    collectButton.onPressed = null;
  }

  startCollecting(Garbage garbage) {
    print('startCollecting: ${garbage.runtimeType} : ${garbage.collectionTimeInSeconds}');
    remainingCollectTime.value = garbage.collectionTimeInSeconds.toDouble();
    print('remainingCollectTime: ${remainingCollectTime.value}');
    remainingCollectTimeTimer.reset();
    remainingCollectTimeTimer.start();
  }
}
