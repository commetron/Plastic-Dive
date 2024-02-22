import 'package:plasticdiver/game/components/components.dart';

class FoodPackaging extends Garbage {
  FoodPackaging({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'food_packaging.png';

  @override
  int get points => 10;

  @override
  int get collectionTimeInSeconds => 2;

  @override
  double get garbageWidth => 35;
}
