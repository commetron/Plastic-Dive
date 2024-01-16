import 'dart:async';
import 'dart:math';

import 'package:dive_game/game/components/garbages/bottle.dart';
import 'package:dive_game/game/dive_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

enum GarbageType { bottle }

abstract class Garbage extends SpriteComponent with HasGameReference<DiveGame>, CollisionCallbacks {
  abstract final int points;

  abstract final String image;

  Vector2 floatingVelocity = Vector2(10, 10);

  Garbage({
    Vector2? position,
    Vector2? size,
    Anchor anchor = Anchor.center,
  }) : super(
          position: position,
          size: size,
          anchor: anchor,
        );

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite('garbages/$image');
    size = sprite!.originalSize;

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Give a floating effect to the garbage
    // Move it from -1 to 1 in the x and y axis
    Random random = Random();
    int min = -2, max = 2;
    double next = (min + random.nextInt(max - min)) * random.nextDouble();
    position.add(floatingVelocity * dt * next);
  }

  factory Garbage.random({Vector2? position, Random? random}) {
    final values = [GarbageType.bottle];
    final obstacleType = values.random(random);
    switch (obstacleType) {
      case GarbageType.bottle:
      default:
        // TODO not good that the abstraction knows the implementations
        return Bottle(position: position);
    }
  }
}
