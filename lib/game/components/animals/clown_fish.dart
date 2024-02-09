import 'package:flame/game.dart';
import 'package:plasticdiver/game/components/animals/animal.dart';

class ClownFish extends Animal {
  ClownFish({
    required super.isGoingRight,
    required super.maxDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'clown-fish.png';

  @override
  Vector2 get floatingVelocity => Vector2(100, 0);
}
