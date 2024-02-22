import 'package:plasticdiver/game/components/components.dart';

class PlasticBag extends Garbage {
  PlasticBag({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'plastic_bag.png';

  @override
  int get points => 10;

  @override
  int get collectionTimeInSeconds => 1;

  @override
  double get garbageWidth => 50;
}
