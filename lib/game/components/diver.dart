import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:plastic_diver/game/components/components.dart';
import 'package:plastic_diver/game/dive_game.dart';
import 'package:plastic_diver/constants.dart';

class Diver extends SpriteAnimationComponent with HasGameReference<DiveGame>, CollisionCallbacks, KeyboardHandler {
  final spriteSize = Vector2(101.1, 40.0);
  static int numberFrames = 10;

  Vector2 velocity = Vector2.zero();
  static const double maxSpeed = 300;

  bool isGoingRight = true;

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

    // 1st compute the velocity
    if (!keyboardDelta.isZero()) {
      velocity = keyboardDelta * maxSpeed * dt;
    }
    // TODO see if activeCollisions.isEmpty is needed
    else if (!joystick.delta.isZero() && activeCollisions.isEmpty) {
      velocity = joystick.relativeDelta * maxSpeed * dt;
      // angle = joystick.relativeDelta.screenAngle();
    } else {
      velocity = Vector2.zero();
    }

    // 2. Add velocity to not pass the bounds
    if (position.x + velocity.x > Constants.worldWidth / 2) {
      velocity.x = 0;
    }
    if (position.x + velocity.x < -Constants.worldWidth / 2) {
      velocity.x = 0;
    }
    if (position.y + velocity.y > Constants.worldDeepness) {
      velocity.y = 0;
    }
    if (position.y + velocity.y < 0) {
      velocity.y = 0;
    }

    // 4 Update the side + orientation of the sprite
    if (velocity.x < 0 && isGoingRight) {
      isGoingRight = false;
      flipHorizontallyAroundCenter();
    } else if (velocity.x > 0 && !isGoingRight) {
      isGoingRight = true;
      flipHorizontallyAroundCenter();
    }
    if (velocity.y < 0) {
      angle = 0.3 * (isGoingRight ? -1 : 1);
    } else if (velocity.y > 0) {
      angle = 0.3 * (isGoingRight ? 1 : -1);
    } else {
      angle = 0;
    }

    // 4. Update the position
    position.add(velocity);

    // 5. Update dive depth in the HUD
    game.diveDepth.value = divingDepth;
  }

  // Keyboard handling
  Vector2 keyboardDelta = Vector2.zero();
  static final _keysWatched = {
    LogicalKeyboardKey.arrowUp,
    LogicalKeyboardKey.arrowDown,
    LogicalKeyboardKey.arrowLeft,
    LogicalKeyboardKey.arrowRight,
    LogicalKeyboardKey.space,
  };
  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    keyboardDelta.setZero();

    if (!_keysWatched.contains(event.logicalKey)) return true;

    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.space) {
        // TODO Do collect garbage if there is one
        print("Space pressed");
      }

      if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
        keyboardDelta.y = -1;
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
        keyboardDelta.x = -1;
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
        keyboardDelta.y = 1;
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
        keyboardDelta.x = 1;
      }
    }

    return false;
  }

  // Actions
  void collectGarbage(Garbage garbage) {
    if (garbage.isRemoved || garbage.isRemoving) return;
    garbage.removeFromParent();
    // TODO Pass addScore method to Diver constructor
    game.score.value += garbage.points;
    debugPrint("Score: ${game.score}");
  }

  // Collision callbacks

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    // TODO enable button
    if (other is Garbage) {
      collectGarbage(other);
    }

    if (other is Surface) {
      print("OK");
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    // TODO disable button
    if (other is Garbage) {
      collectGarbage(other);
    }
    if (other is Surface) {
      print("OK");
    }
  }
}
