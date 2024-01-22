import 'package:plasticdiver/game/components/components.dart';

class Straw extends Garbage {
  Straw({
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'straw.png';

  @override
  int get points => 10;

  @override
  int get collectionTimeInSeconds => 1;
}
