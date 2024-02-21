import 'package:plasticdiver/game/components/components.dart';

class CottonRod extends Garbage {
  CottonRod({
    required super.maxDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'cotton_rod.png';

  @override
  int get points => 10;

  @override
  int get collectionTimeInSeconds => 2;
}
