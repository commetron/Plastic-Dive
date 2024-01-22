import 'package:plasticdiver/game/components/components.dart';

class MicroplasticCloud extends Garbage {
  MicroplasticCloud({
    super.position,
    super.size,
    super.anchor,
  });

  @override
  String get image => 'microplastic_cloud.png';

  @override
  int get points => 10;

  @override
  int get collectionTimeInSeconds => 10;
}
