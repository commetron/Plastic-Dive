import 'dart:async';

import 'package:dive_game/constants.dart';
import 'package:dive_game/game/components/components.dart';
import 'package:dive_game/game/components/hud.dart';
import 'package:dive_game/game/dive_world.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

class DiveGame extends FlameGame<DiveWorld> {
  final score = ValueNotifier(0);

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
    camera.viewport.add(Hud(scoreNotifier: score));
    camera.viewport.add(joystick = Joystick());
  }

  @override
  bool get debugMode => false;

  // @override
  // Color backgroundColor() => const Color(0xFF0A6163);
}
