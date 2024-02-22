import 'package:plasticdiver/game/components/components.dart';

class Cutlery extends Garbage {
  Cutlery({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'fork.png';

  @override
  int get points => 10;

  @override
  int get collectionTimeInSeconds => 2;

  @override
  double get garbageWidth => 35;
}
