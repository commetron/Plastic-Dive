import 'package:flame/components.dart';
import 'package:plastic_diver/game/components/components.dart';

class SodaCan extends Garbage {
  SodaCan({
    Vector2? position,
    Vector2? size,
    Anchor anchor = Anchor.center,
  }) : super(
          position: position,
          size: size,
          anchor: anchor,
        );

  @override
  String get image => 'soda_can.png';

  @override
  int get points => 10;
}
