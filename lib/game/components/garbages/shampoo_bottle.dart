import 'package:plasticdiver/game/components/components.dart';

class ShampooBottle extends Garbage {
  ShampooBottle({
    required super.maxDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'shampoo_bottle.png';

  @override
  int get points => 10;

  @override
  int get collectionTimeInSeconds => 2;
}
