import 'dart:async';

import 'package:dive_game/game/components/components.dart';
import 'package:dive_game/game/dive_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';

class Diver extends SpriteAnimationComponent with CollisionCallbacks, HasGameReference<DiveGame> {
  final spriteSize = Vector2(101.1, 40.0);
  static int numberFrames = 10;

  Vector2 velocity = Vector2.zero();
  static const double maxSpeed = 300;

  final JoystickComponent joystick;

  double get divingDepth => (position.y / 250);

  Diver({required this.joystick})
      : super(
          position: Vector2.zero(),
          size: Vector2(101.1, 40.0),
          anchor: Anchor.center,
        );

  @override
  FutureOr<void> onLoad() async {
    animation = await game.loadSpriteAnimation(
      'players/diver.png',
      SpriteAnimationData.sequenced(
        textureSize: spriteSize,
        amount: numberFrames,
        stepTime: 0.2,
      ),
    );

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!joystick.delta.isZero() && activeCollisions.isEmpty) {
      velocity = joystick.relativeDelta * maxSpeed * dt;
      position.add(velocity);
      angle = joystick.relativeDelta.screenAngle();
      // angle = joystick.delta.screenAngle();
    } else {
      velocity = Vector2.zero();
    }
  }

  void collectGarbage(Garbage garbage) {
    if (garbage.isRemoved || garbage.isRemoving) return;
    garbage.removeFromParent();
    // TODO Pass addScore method to Diver constructor
    game.score.value += garbage.points;
    debugPrint("Score: ${game.score}");
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    // TODO enable button
    if (other is Garbage) {
      collectGarbage(other);
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    // TODO disable button
    if (other is Garbage) {
      collectGarbage(other);
    }
  }
}
