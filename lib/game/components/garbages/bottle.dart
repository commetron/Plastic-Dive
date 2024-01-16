import 'package:dive_game/game/components/garbages/garbage.dart';
import 'package:flame/components.dart';

class Bottle extends Garbage {
  Bottle({
    Vector2? position,
    Vector2? size,
    Anchor anchor = Anchor.center,
  }) : super(
          position: position,
          size: size,
          anchor: anchor,
        );

  @override
  String get image => 'bottle.png';

  @override
  int get points => 10;
}
