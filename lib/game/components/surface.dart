import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';

class Surface extends PositionComponent {
  Surface({
    required Vector2 position,
    Anchor anchor = Anchor.center,
  }) : super(
          position: position,
          size: Vector2(2000, 10),
          anchor: Anchor.center,
        );

  @override
  FutureOr<void> onLoad() {
    // TODO load a nice image for the surface
    // TODO add(RectangleHitbox(position: position - Vector2(0, 10), size: size));
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), Paint()..color = const Color(0xFF00FF00));
  }
}
