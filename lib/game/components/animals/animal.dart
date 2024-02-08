import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:plasticdiver/constants.dart';
import 'package:plasticdiver/game/components/animals/clown_fish.dart';
import 'package:plasticdiver/game/components/animals/coral.dart';
import 'package:plasticdiver/game/components/animals/exotic_fish.dart';
import 'package:plasticdiver/game/components/animals/globe_fish.dart';
import 'package:plasticdiver/game/components/animals/jelly_fish.dart';
import 'package:plasticdiver/game/components/animals/tuna_fish.dart';
import 'package:plasticdiver/game/dive_game.dart';

enum AnimalType {
  clownFish,
  coral1,
  coral2,
  coral3,
  exoticFish,
  globeFish,
  jellyfish,
  tunaFish
}

abstract class Animal extends SpriteComponent with HasGameReference<DiveGame> {
  abstract final String image;
  bool isGoingRight = true;

  Vector2 floatingVelocity = Vector2(10, 10);

  Animal({
    this.isGoingRight = true,
    super.position,
    super.size,
    Anchor super.anchor = Anchor.center,
  });

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite('animals/$image');
    final ratio = sprite!.originalSize.x / sprite!.originalSize.y;
    size = Vector2(35 * ratio, 35);

    if (!isGoingRight) {
      floatingVelocity = Vector2(-floatingVelocity.x, floatingVelocity.y);
      flipHorizontallyAroundCenter();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Make them swim
    position.add(floatingVelocity * dt);

    if (position.x < -Constants.worldWidth / 2 ||
        position.x > Constants.worldWidth / 2 ||
        position.y < 0 ||
        position.y > Constants.worldDeepness) {
      removeFromParent();
    }
  }

  factory Animal.random({Vector2? position, Random? random}) {
    final obstacleType = AnimalType.values.random(random);
    final isGoingRight = random!.nextBool();
    switch (obstacleType) {
      case AnimalType.clownFish:
        return ClownFish(position: position, isGoingRight: isGoingRight);
      case AnimalType.coral1:
        return Coral(position: position, number: 1, isGoingRight: isGoingRight);
      case AnimalType.coral2:
        return Coral(position: position, number: 2, isGoingRight: isGoingRight);
      case AnimalType.coral3:
        return Coral(position: position, number: 3, isGoingRight: isGoingRight);
      case AnimalType.exoticFish:
        return ExoticFish(position: position, isGoingRight: isGoingRight);
      case AnimalType.globeFish:
        return GlobeFish(position: position, isGoingRight: isGoingRight);
      case AnimalType.jellyfish:
        return JellyFish(position: position, isGoingRight: isGoingRight);
      case AnimalType.tunaFish:
      default:
        // TODO not good that the abstraction knows the implementations
        return TunaFish(position: position);
    }
  }
}
