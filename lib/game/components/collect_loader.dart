import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';

class CollectLoader extends PositionComponent with HasVisibility {
  double sweepAngle = 0;
  int loadingTime = 0;

  double get increment => 2 * pi / loadingTime;

  CollectLoader()
      : super(
          size: Vector2(20, 20),
          anchor: Anchor.center,
        );

  void start({required int collectingTime}) {
    sweepAngle = 0.5;
    loadingTime = collectingTime;
    isVisible = true;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawArc(
      size.toRect(),
      0,
      sweepAngle,
      false,
      Paint()
        ..color = const Color(0xFFFFD700)
        ..style = PaintingStyle.stroke
        ..strokeWidth = size.x / 5,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (sweepAngle < pi * 2) {
      sweepAngle += increment * dt;
    } else if (isVisible) {
      isVisible = false;
    }
  }
}
