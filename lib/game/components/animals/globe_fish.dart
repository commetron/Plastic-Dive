import 'package:flame/game.dart';
import 'package:plasticdiver/constants.dart';
import 'package:plasticdiver/game/components/animals/animal.dart';

class GlobeFish extends Animal {
  GlobeFish({
    required super.isGoingRight,
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  static const double minDepth = 10;
  static const double maxDepth = 2000;

  @override
  double get animalWidth => 40;

  @override
  String get image => 'globe_fish.png';

  @override
  Vector2 get floatingVelocity => Vector2(0.5 * Constants.fishVelocityMultiplier, 0);
}
