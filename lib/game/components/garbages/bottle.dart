import 'package:plasticdiver/game/components/components.dart';

class Bottle extends Garbage {
  Bottle({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'bottle.png';

  @override
  int get points => 100000;

  @override
  int get collectionTimeInSeconds => 2;

  @override
  double get garbageWidth => 45;
}
