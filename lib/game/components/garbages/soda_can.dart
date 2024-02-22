import 'package:plasticdiver/game/components/components.dart';

class SodaCan extends Garbage {
  SodaCan({
    required super.maxWorldDeepness,
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'soda_can.png';

  @override
  int get points => 10;

  @override
  int get collectionTimeInSeconds => 2;

  @override
  double get garbageWidth => 40;
}
