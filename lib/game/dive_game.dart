import 'dart:async';

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
  ValueNotifier<double> remainingTime;

  // Timer
  final countdownTimer = Timer(0.1, autoStart: true, repeat: true);

  final ValueNotifier<double> remainingCollectTime = ValueNotifier(0.0);
  final remainingCollectTimeTimer = Timer(0.5, autoStart: false, repeat: true);

  Function(bool hasWon, int score) onGameOver;
  int airTankLevel;
  int swimmingSpeedLevel;
  int collectingSpeedLevel;
  int diveDepthLevel;
  int previousHighScore;
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
    required this.previousHighScore,
    required this.isSoundEnabled,
  })  : remainingTime = ValueNotifier(Constants.airTankCapacityInSeconds[airTankLevel]),
        super(
          world: DiveWorld(
            worldDeepness: Constants.worldDeepness[diveDepthLevel],
            diveDepthLevel: diveDepthLevel,
            swimmingSpeedLevel: swimmingSpeedLevel,
          ),
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
    await camera.backdrop.add(background = Background(size: Vector2(Constants.worldWidthWithOffset, Constants.worldDeepness[diveDepthLevel])));

    if (debugMode) {
      await camera.viewport.add(FpsTextComponent(position: Vector2(Constants.gameWidth - 20, 20), anchor: Anchor.topRight));
    }

    await camera.viewport.add(Score(scoreNotifier: score, previousHighScore: previousHighScore));
    await camera.viewport.add(AirTank(remainingTimeNotifier: remainingTime, initialTimeInSeconds: Constants.airTankCapacityInSeconds[airTankLevel]));
    await camera.viewport.add(Nanometer(diveDepthNotifier: diveDepth, maxDepth: Constants.worldDeepness.last));
    await camera.viewport.add(joystick = Joystick());
    await camera.viewport.add(collectButton = CollectButton());

    await camera.viewport.add(PauseButton());

    // Darken the world as we go deeper
    await camera.viewport.add(darkenEffect = RectangleComponent(
      size: Vector2(Constants.gameWidth, Constants.gameHeight),
      paint: Paint()..color = const Color(0x00000000),
      priority: -100,
    ));

    // Add callback to update score text
    countdownTimer.onTick = () {
      remainingTime.value -= countdownTimer.limit;
      if (remainingTime.value <= 0) {
        // Time is over -> player lost
        endTheGame(false, score.value);
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
      if (!hasDived && diveDepth.value > 0.2) {
        hasDived = true;
      }

      if (hasDived && diveDepth.value <= 0.1) {
        endTheGame(true, score.value);
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
    collectButton.enable(
      collectionTimeInSeconds: garbage.collectionTimeWithSpeedFactor,
      onPressed: () => world.diver.collectGarbage(garbage),
    );
  }

  void disableCollectButton(Garbage garbage) {
    collectButton.disable();
  }

  void endTheGame(bool hasWon, int score) {
    pauseEngine();

    countdownTimer.stop();
    remainingCollectTimeTimer.stop();

    if (isSoundEnabled) {
      FlameAudio.bgm.stop();
      FlameAudio.play(hasWon ? 'sfx/game-win.mp3' : 'sfx/game-over.mp3');
    }

    onGameOver(hasWon, score);
  }

  startCollecting(Garbage garbage) {
    print('startCollecting: ${garbage.runtimeType} : ${garbage.collectionTimeWithSpeedFactor}');
    remainingCollectTime.value = garbage.collectionTimeWithSpeedFactor;
    print('remainingCollectTime: ${remainingCollectTime.value}');
    remainingCollectTimeTimer.reset();
    remainingCollectTimeTimer.start();
  }

  void resumeGame() {
    FlameAudio.bgm.resume();
    overlays.clear();
    // overlays.remove('PauseMenu');
    resumeEngine();
  }

  void exitGame() {
    endTheGame(false, score.value);
  }
}
