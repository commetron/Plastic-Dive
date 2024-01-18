import 'dart:math';

import 'package:dive_game/constants.dart';
import 'package:dive_game/game/components/components.dart';
import 'package:dive_game/game/components/floor.dart';
import 'package:dive_game/game/dive_game.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';

class DiveWorld extends World with HasGameReference<DiveGame>, HasCollisionDetection {
  late Diver diver;
  late DiverTrail diverTrail;

  final _random = Random();

  Vector2 get size => (parent as FlameGame).size;

  final Vector2 groundLevel = Vector2.zero();
  final Vector2 floorLevel = Vector2(0, Constants.worldDeepness);

  @override
  Future<void> onLoad() async {
    add(Surface(position: groundLevel, size: Vector2(Constants.worldWidth, 10)));
    add(Floor(position: floorLevel, size: Vector2(Constants.worldWidth, 10)));
    add(diver = Diver(joystick: game.joystick));
    add(diverTrail = DiverTrail(diver: diver));

    add(
      SpawnComponent.periodRange(
        factory: (_) => Garbage.random(
          random: _random,
        ),
        minPeriod: 0.5,
        maxPeriod: 5,
        // selfPositioning: true, // Use only to self position the component ourselves
        area: Rectangle.fromPoints(
          Vector2(-Constants.worldWidth / 2, groundLevel.y + 10),
          Vector2(Constants.worldWidth / 2, Constants.worldDeepness),
        ),
        random: _random,
      ),
    );

    game.camera.follow(diver);
  }
}
