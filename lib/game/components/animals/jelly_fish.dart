import 'package:flame/game.dart';
import 'package:plasticdiver/game/components/animals/animal.dart';

class JellyFish extends Animal {
  JellyFish({
    required super.isGoingRight,
    required super.maxDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'jelly-fish.png';

  @override
  Vector2 get floatingVelocity => Vector2(0, 40);
}
