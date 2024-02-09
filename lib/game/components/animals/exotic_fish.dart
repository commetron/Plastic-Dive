import 'package:flame/game.dart';
import 'package:plasticdiver/game/components/animals/animal.dart';

class ExoticFish extends Animal {
  ExoticFish({
    required super.isGoingRight,
    required super.maxDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'exotic-fish.png';

  @override
  Vector2 get floatingVelocity => Vector2(50, 0);
}
