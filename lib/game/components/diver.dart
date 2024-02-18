import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:plasticdiver/constants.dart';
import 'package:plasticdiver/game/components/collect_loader.dart';
import 'package:plasticdiver/game/components/components.dart';
import 'package:plasticdiver/game/dive_game.dart';

class Diver extends SpriteAnimationComponent with HasGameReference<DiveGame>, CollisionCallbacks, KeyboardHandler {
  final spriteSize = Vector2(101.1, 40.0);
  static int numberSpriteFrames = 10;

  Vector2 velocity = Vector2.zero();
  double maxSpeed;

  bool isGoingRight = true;

  bool isCollecting = false;

  final JoystickComponent joystick;

  Function(Garbage garbage) onGarbageCollisionStart;

  Function(Garbage garbage) onGarbageCollisionEnd;

  Function(Garbage garbage) onStartCollecting;

  final double worldDeepness;

  late CollectLoader collectLoader;

  double get divingDepth => (position.y / 250);
  TextComponent remainingCollectTimeInSeconds = TextComponent(text: '0');

  Diver({
    required this.worldDeepness,
    required swimmingSpeedLevel,
    required this.joystick,
    required this.onGarbageCollisionStart,
    required this.onGarbageCollisionEnd,
    required ValueNotifier<double> remainingCollectTime,
    required this.onStartCollecting,
  })  : maxSpeed = Constants.maxDiverSpeed[swimmingSpeedLevel],
        super(
          position: Vector2.zero(),
          size: Vector2(101.1, 40.0),
          anchor: Anchor.center,
        ) {
    remainingCollectTime.addListener(() {
      isCollecting = remainingCollectTime.value > 0;
      remainingCollectTimeInSeconds.text = remainingCollectTime.value.toString();
    });
  }

  @override
  FutureOr<void> onLoad() async {
    animation = await game.loadSpriteAnimation(
      'players/diver.png',
      SpriteAnimationData.sequenced(
        textureSize: spriteSize,
        amount: numberSpriteFrames,
        stepTime: 0.2,
      ),
    );

    add(collectLoader = CollectLoader());
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Update the remaining time
    if (remainingCollectTimeInSeconds.text != '0') {
      remainingCollectTimeInSeconds.update(dt);
    }

    if (isCollecting) {
      velocity = Vector2.zero();
      // No movement while collecting
      return;
    }

    // 1st compute the velocity
    if (!keyboardDelta.isZero()) {
      velocity = keyboardDelta * maxSpeed * dt;
    }
    // TODO see if activeCollisions.isEmpty is needed
    else if (!joystick.delta.isZero()) {
      velocity = joystick.relativeDelta * maxSpeed * dt;
      // angle = joystick.relativeDelta.screenAngle();
    } else {
      velocity = Vector2.zero();
    }

    // 2. Modify velocity to not pass the bounds
    if (position.x + velocity.x > Constants.worldWidth / 2) {
      velocity.x = 0;
    }
    if (position.x + velocity.x < -Constants.worldWidth / 2) {
      velocity.x = 0;
    }
    if (position.y + velocity.y > worldDeepness) {
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
        // Press the button to collect the garbage if any
        game.collectButton.onPressed?.call();
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

    return true;
  }

  // Actions
  void collectGarbage(Garbage garbage) {
    if (garbage.isRemoved || garbage.isRemoving || isCollecting) return;

    var collectingTime = garbage.collectionTimeWithSpeedFactor;
    isCollecting = true;
    garbage.startCollecting();
    collectLoader.start(collectingTime: collectingTime, isFlipped: !isGoingRight);
    onStartCollecting(garbage);

    // Move that when the garbage is collected after the timeout
    // TODO take collecting time milliseconds into account
    Future.delayed(Duration(seconds: collectingTime.ceil()), () {
      garbage.removeFromParent();
      isCollecting = false;
      FlameAudio.play('sfx/collected.mp3');
      // TODO Pass addScore method to Diver constructor
      game.score.value += garbage.points;
    });
  }

  // Collision callbacks

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Garbage) {
      onGarbageCollisionStart(other);
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    if (other is Garbage) {
      onGarbageCollisionEnd(other);
    }
  }
}
