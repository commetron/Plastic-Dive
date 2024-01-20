import 'package:flame/components.dart';
import 'package:plastic_diver/game/components/components.dart';

class MicroplasticCloud extends Garbage {
  MicroplasticCloud({
    Vector2? position,
    Vector2? size,
    Anchor anchor = Anchor.center,
  }) : super(
          position: position,
          size: size,
          anchor: anchor,
        );

  @override
  String get image => 'microplastic_cloud.png';

  @override
  int get points => 10;
}
