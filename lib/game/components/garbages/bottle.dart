import 'package:plasticdiver/game/components/components.dart';

class Bottle extends Garbage {
  Bottle({
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'bottle.png';

  @override
  int get points => 10;

  @override
  int get collectionTimeInSeconds => 2;
}
