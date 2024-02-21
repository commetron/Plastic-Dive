import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:plasticdiver/constants.dart';
import 'package:plasticdiver/game/components/animals/angler_fish.dart';
import 'package:plasticdiver/game/components/animals/clown_fish.dart';
import 'package:plasticdiver/game/components/animals/coral.dart';
import 'package:plasticdiver/game/components/animals/exotic_fish.dart';
import 'package:plasticdiver/game/components/animals/globe_fish.dart';
import 'package:plasticdiver/game/components/animals/jelly_fish.dart';
import 'package:plasticdiver/game/components/animals/shark.dart';
import 'package:plasticdiver/game/components/animals/tuna_fish.dart';
import 'package:plasticdiver/game/components/animals/whale.dart';
import 'package:plasticdiver/game/dive_game.dart';

enum AnimalType { clownFish, coral1, coral2, coral3, exoticFish, globeFish, jellyfish, tunaFish, whale, shark, anglerFish }

// TODO do better
List<List<AnimalType>> animalTypesByLevel = [
  [AnimalType.clownFish, AnimalType.coral1, AnimalType.coral2, AnimalType.coral3],
  [
    AnimalType.clownFish,
    AnimalType.coral1,
    AnimalType.coral2,
    AnimalType.coral3,
    AnimalType.exoticFish,
    AnimalType.globeFish,
    AnimalType.jellyfish,
    AnimalType.tunaFish
  ],
  [
    AnimalType.clownFish,
    AnimalType.coral1,
    AnimalType.coral2,
    AnimalType.coral3,
    AnimalType.exoticFish,
    AnimalType.globeFish,
    AnimalType.jellyfish,
    AnimalType.tunaFish
  ],
  [
    AnimalType.clownFish,
    AnimalType.coral1,
    AnimalType.coral2,
    AnimalType.coral3,
    AnimalType.exoticFish,
    AnimalType.globeFish,
    AnimalType.jellyfish,
    AnimalType.tunaFish,
    AnimalType.whale,
    AnimalType.anglerFish,
    AnimalType.shark,
  ],
  [
    AnimalType.clownFish,
    AnimalType.coral1,
    AnimalType.coral2,
    AnimalType.coral3,
    AnimalType.exoticFish,
    AnimalType.globeFish,
    AnimalType.jellyfish,
    AnimalType.tunaFish,
    AnimalType.whale,
    AnimalType.anglerFish,
    AnimalType.shark,
  ],
  [
    AnimalType.clownFish,
    AnimalType.coral1,
    AnimalType.coral2,
    AnimalType.coral3,
    AnimalType.exoticFish,
    AnimalType.globeFish,
    AnimalType.jellyfish,
    AnimalType.tunaFish,
    AnimalType.whale,
    AnimalType.anglerFish,
    AnimalType.shark,
  ]
];

abstract class Animal extends SpriteComponent with HasGameReference<DiveGame> {
  abstract final String image;
  abstract final double animalWidth;
  final bool isGoingRight;

  final double maxWorldDeepness;

  Vector2 floatingVelocity = Vector2(10, 10);

  Animal({
    required this.isGoingRight,
    required this.maxWorldDeepness,
    super.position,
    super.size,
    Anchor super.anchor = Anchor.center,
  });

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite('animals/$image');
    final ratio = sprite!.originalSize.x / sprite!.originalSize.y;
    size = Vector2(animalWidth * ratio, animalWidth);

    if (!isGoingRight) {
      flipHorizontallyAroundCenter();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Make them swim
    position.add((isGoingRight ? floatingVelocity : -floatingVelocity) * dt);

    if (position.x < -Constants.worldWidthWithOffset / 2 ||
        position.x > Constants.worldWidthWithOffset / 2 ||
        position.y < 0 ||
        position.y > maxWorldDeepness) {
      removeFromParent();
    }
  }

  static double randBetween(double min, double max, Random rand) => min + ((max - min) * rand.nextDouble());

  factory Animal.random({required double maxWorldDeepness, Random? random, required int diveDepthLevel}) {
    final obstacleType = animalTypesByLevel[diveDepthLevel].random(random);
    final isGoingRight = random!.nextBool();
    final double positionX = randBetween(-Constants.worldWidth / 2, Constants.worldWidth / 2, random);
    switch (obstacleType) {
      case AnimalType.clownFish:
        return ClownFish(
            position: Vector2(positionX, randBetween(ClownFish.minDepth, min(ClownFish.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.coral1:
        return Coral(
            position: Vector2(positionX, randBetween(Coral.minDepth, min(Coral.maxDepth, maxWorldDeepness), random)),
            number: 1,
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.coral2:
        return Coral(
            position: Vector2(positionX, randBetween(Coral.minDepth, min(Coral.maxDepth, maxWorldDeepness), random)),
            number: 2,
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.coral3:
        return Coral(
            position: Vector2(positionX, randBetween(Coral.minDepth, min(Coral.maxDepth, maxWorldDeepness), random)),
            number: 3,
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.exoticFish:
        return ExoticFish(
            position: Vector2(positionX, randBetween(ExoticFish.minDepth, min(ExoticFish.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.globeFish:
        return GlobeFish(
            position: Vector2(positionX, randBetween(GlobeFish.minDepth, min(GlobeFish.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.jellyfish:
        return JellyFish(
            position: Vector2(positionX, randBetween(JellyFish.minDepth, min(JellyFish.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.shark:
        return Shark(
            position: Vector2(positionX, randBetween(Shark.minDepth, min(Shark.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.anglerFish:
        return AnglerFish(
            position: Vector2(positionX, randBetween(AnglerFish.minDepth, min(AnglerFish.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.whale:
        return Whale(
            position: Vector2(positionX, randBetween(Whale.minDepth, min(Whale.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.tunaFish:
      default:
        // TODO not good that the abstraction knows the implementations
        return TunaFish(
            position: Vector2(positionX, randBetween(TunaFish.minDepth, min(TunaFish.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
    }
  }
}
