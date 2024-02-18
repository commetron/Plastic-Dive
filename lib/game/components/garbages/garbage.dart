import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:plasticdiver/constants.dart';
import 'package:plasticdiver/game/components/garbages/bottle.dart';
import 'package:plasticdiver/game/components/garbages/household_cleaner_bottle.dart';
import 'package:plasticdiver/game/components/garbages/microplastic_cloud.dart';
import 'package:plasticdiver/game/components/garbages/plastic_bag.dart';
import 'package:plasticdiver/game/components/garbages/shampoo_bottle.dart';
import 'package:plasticdiver/game/components/garbages/soda_can.dart';
import 'package:plasticdiver/game/components/garbages/straw.dart';
import 'package:plasticdiver/game/dive_game.dart';

enum GarbageType { bottle, sodaCan, householdCleanerBottle, shampooBottle, plasticBag, straw, microplasticCloud }

abstract class Garbage extends SpriteComponent with HasGameReference<DiveGame> {
  abstract final int points;
  abstract final int collectionTimeInSeconds;

  double get collectionTimeWithSpeedFactor => collectionTimeInSeconds / Constants.collectSpeedFactor[game.collectingSpeedLevel];

  abstract final String image;

  Vector2 floatingVelocity = Vector2(10, 10);

  final double maxDeepness;

  bool isHighlighted = false;
  bool isBeingCollected = false;

  Garbage({
    required this.maxDeepness,
    super.position,
    super.size,
    Anchor super.anchor = Anchor.center,
  });

  // @override
  // Decorator get decorator => PaintDecorator.tint(const Color(0xAAFF0000));

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite('garbages/$image');
    final ratio = sprite!.originalSize.x / sprite!.originalSize.y;
    size = Vector2(35 * ratio, 35);

    add(RectangleHitbox());
  }

  startCollecting() {
    isBeingCollected = true;
    add(
      SequenceEffect([
        ScaleEffect.by(
          Vector2.all(1.5),
          EffectController(duration: collectionTimeWithSpeedFactor / 4, alternate: true),
        ),
        ScaleEffect.by(
          Vector2.zero(),
          EffectController(duration: collectionTimeWithSpeedFactor / 4 * 3, alternate: true),
        ),
      ]),
    );
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

    if (position.x < -Constants.worldWidthWithOffset / 2 ||
        position.x > Constants.worldWidthWithOffset / 2 ||
        position.y < 0 ||
        position.y > maxDeepness) {
      removeFromParent();
    }
  }

  factory Garbage.random({required double maxDeepness, Vector2? position, Random? random}) {
    final obstacleType = GarbageType.values.random(random);
    switch (obstacleType) {
      case GarbageType.sodaCan:
        return SodaCan(position: position, maxDeepness: maxDeepness);
      case GarbageType.householdCleanerBottle:
        return HouseholdCleanerBottle(position: position, maxDeepness: maxDeepness);
      case GarbageType.shampooBottle:
        return ShampooBottle(position: position, maxDeepness: maxDeepness);
      case GarbageType.plasticBag:
        return PlasticBag(position: position, maxDeepness: maxDeepness);
      case GarbageType.straw:
        return Straw(position: position, maxDeepness: maxDeepness);
      case GarbageType.microplasticCloud:
        return MicroplasticCloud(position: position, maxDeepness: maxDeepness);
      case GarbageType.bottle:
      default:
        // TODO not good that the abstraction knows the implementations
        return Bottle(position: position, maxDeepness: maxDeepness);
    }
  }
}
