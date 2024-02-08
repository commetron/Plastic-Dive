import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:plasticdiver/constants.dart';
import 'package:plasticdiver/game/components/animals/animal.dart';
import 'package:plasticdiver/game/components/components.dart';
import 'package:plasticdiver/game/dive_game.dart';

class DiveWorld extends World with HasGameReference<DiveGame>, HasCollisionDetection {
  late Diver diver;
  late DiverTrail diverTrail;

  final _random = Random();

  final double worldDeepness;

  Vector2 get size => (parent as FlameGame).size;

  DiveWorld({required this.worldDeepness});

  @override
  Future<void> onLoad() async {
    final Vector2 groundLevel = Vector2(-Constants.gameWidth, 0);
    final Vector2 floorLevel = Vector2(-Constants.gameWidth, worldDeepness);

    add(Surface(position: groundLevel, size: Vector2(Constants.worldWidth, 300))); // TODO
    add(Floor(position: floorLevel, size: Vector2(Constants.worldWidth, 200))); // TODO
    add(diver = Diver(
      worldDeepness: worldDeepness,
      joystick: game.joystick,
      onGarbageCollisionStart: (garbage) => game.enableCollectButton(garbage),
      onGarbageCollisionEnd: (garbage) => game.disableCollectButton(garbage),
      remainingCollectTime: game.remainingCollectTime,
      onStartCollecting: (garbage) => game.startCollecting(garbage),
    ));
    add(diverTrail = DiverTrail(diver: diver));

    add(
      SpawnComponent.periodRange(
        factory: (_) => Garbage.random(
          random: _random,
        ),
        minPeriod: 0.5,
        maxPeriod: 3,
        // selfPositioning: true, // Use only to self position the component ourselves
        area: Rectangle.fromPoints(
          Vector2(-Constants.worldWidth / 2, groundLevel.y + 10),
          Vector2(Constants.worldWidth / 2, worldDeepness),
        ),
        random: _random,
      ),
    );

    add(
      SpawnComponent.periodRange(
        factory: (_) => Animal.random(
          random: _random,
        ),
        minPeriod: 1,
        maxPeriod: 3,
        // selfPositioning: true, // Use only to self position the component ourselves
        area: Rectangle.fromPoints(
          Vector2(-Constants.worldWidth / 2, groundLevel.y + 10),
          Vector2(Constants.worldWidth / 2, worldDeepness),
        ),
        random: _random,
      ),
    );

    game.camera.follow(diver);
  }
}
