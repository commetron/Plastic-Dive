import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:plasticdiver/constants.dart';
import 'package:plasticdiver/game/components/animals/angel_fish.dart';
import 'package:plasticdiver/game/components/animals/angler_fish.dart';
import 'package:plasticdiver/game/components/animals/clown_fish.dart';
import 'package:plasticdiver/game/components/animals/coral.dart';
import 'package:plasticdiver/game/components/animals/dolphin.dart';
import 'package:plasticdiver/game/components/animals/exotic_fish.dart';
import 'package:plasticdiver/game/components/animals/giant_squid.dart';
import 'package:plasticdiver/game/components/animals/globe_fish.dart';
import 'package:plasticdiver/game/components/animals/hammerhead_shark.dart';
import 'package:plasticdiver/game/components/animals/jelly_fish.dart';
import 'package:plasticdiver/game/components/animals/lion_fish.dart';
import 'package:plasticdiver/game/components/animals/moon_fish.dart';
import 'package:plasticdiver/game/components/animals/parrot_fish.dart';
import 'package:plasticdiver/game/components/animals/sea_horse.dart';
import 'package:plasticdiver/game/components/animals/sea_turtle.dart';
import 'package:plasticdiver/game/components/animals/shark.dart';
import 'package:plasticdiver/game/components/animals/tuna_fish.dart';
import 'package:plasticdiver/game/components/animals/whale.dart';
import 'package:plasticdiver/game/components/animals/whale_shark.dart';
import 'package:plasticdiver/game/dive_game.dart';

enum AnimalType {
  anglerFish,
  angelFish,
  clownFish,
  coral1,
  coral2,
  coral3,
  dolphin,
  exoticFish,
  giantSquid,
  globeFish,
  hammerheadShark,
  jellyfish,
  lionFish,
  moonFish,
  parrotFish,
  seaHorse,
  seaTurtle,
  shark,
  whale,
  tunaFish,
  whaleShark,
}

// TODO do better
List<List<AnimalType>> animalTypesByLevel = [
  // TODO make sure it's OK depending on the level
  AnimalType.values.where((element) => element.index <= 5).toList(),
  AnimalType.values.where((element) => element.index <= 7).toList(),
  AnimalType.values.where((element) => element.index <= 13).toList(),
  AnimalType.values.where((element) => element.index <= 17).toList(),
  AnimalType.values.where((element) => element.index <= 19).toList(),
  AnimalType.values.where((element) => element.index <= 21).toList(),
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
    final animalType = animalTypesByLevel[diveDepthLevel].random(random);
    final isGoingRight = random!.nextBool();
    final double positionX = randBetween(-Constants.worldWidth / 2, Constants.worldWidth / 2, random);

    switch (animalType) {
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
      case AnimalType.angelFish:
        return AngelFish(
            position: Vector2(positionX, randBetween(AngelFish.minDepth, min(AngelFish.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.dolphin:
        return Dolphin(
            position: Vector2(positionX, randBetween(Dolphin.minDepth, min(Dolphin.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.giantSquid:
        return GiantSquid(
            position: Vector2(positionX, randBetween(GiantSquid.minDepth, min(GiantSquid.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.hammerheadShark:
        return HammerheadShark(
            position: Vector2(positionX, randBetween(HammerheadShark.minDepth, min(HammerheadShark.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.lionFish:
        return LionFish(
            position: Vector2(positionX, randBetween(LionFish.minDepth, min(LionFish.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.moonFish:
        return MoonFish(
            position: Vector2(positionX, randBetween(MoonFish.minDepth, min(MoonFish.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.parrotFish:
        return ParrotFish(
            position: Vector2(positionX, randBetween(ParrotFish.minDepth, min(ParrotFish.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.seaHorse:
        return SeaHorse(
            position: Vector2(positionX, randBetween(SeaHorse.minDepth, min(SeaHorse.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.seaTurtle:
        return SeaTurtle(
            position: Vector2(positionX, randBetween(SeaTurtle.minDepth, min(SeaTurtle.maxDepth, maxWorldDeepness), random)),
            isGoingRight: isGoingRight,
            maxWorldDeepness: maxWorldDeepness);
      case AnimalType.whaleShark:
        return WhaleShark(
            position: Vector2(positionX, randBetween(WhaleShark.minDepth, min(WhaleShark.maxDepth, maxWorldDeepness), random)),
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
