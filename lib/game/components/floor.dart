import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';

class Floor extends PositionComponent {
  Floor({
    required Vector2 position,
    required Vector2 size,
    Anchor anchor = Anchor.center,
  }) : super(
          position: position,
          size: size,
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
