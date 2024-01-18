import 'dart:async';

import 'package:dive_game/constants.dart';
import 'package:dive_game/game/components/components.dart';
import 'package:dive_game/game/components/hud.dart';
import 'package:dive_game/game/dive_world.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/cupertino.dart';

class DiveGame extends FlameGame<DiveWorld> with HasKeyboardHandlerComponents {
  // Value Notifiers
  final score = ValueNotifier(0);
  final diveDepth = ValueNotifier(0.0);
  final ValueNotifier<double> remainingTime = ValueNotifier(20.0);

  // Timer
  final countdown = Timer(0.1, autoStart: true, repeat: true);

  late Joystick joystick;
  late Background background;

  DiveGame()
      : super(
          world: DiveWorld(),
          camera: CameraComponent.withFixedResolution(width: Constants.gameWidth, height: Constants.gameHeight),
        );

  @override
  FutureOr<void> onLoad() {
    camera.backdrop.add(background = Background());
    camera.viewport.add(FpsTextComponent(position: Vector2(Constants.gameWidth - 20, 20), anchor: Anchor.topRight));
    camera.viewport.add(Hud(scoreNotifier: score, diveDepthNotifier: diveDepth, remainingTime: remainingTime));
    camera.viewport.add(joystick = Joystick());

    // Add callback to update score text
    countdown.onTick = () {
      remainingTime.value -= 0.1;
      if (remainingTime.value <= 0) {
        pauseEngine();
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
}
