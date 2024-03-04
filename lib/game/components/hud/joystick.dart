import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:plasticdive/constants.dart';

class Joystick extends JoystickComponent {
  static const double radius = 50;

  Joystick(Image backgroundImage, Image knobImage)
      : super(
          anchor: Anchor.bottomLeft,
          position: Vector2(20, Constants.gameHeight - 20),
          background: SpriteComponent.fromImage(backgroundImage, size: Vector2.all(radius * 2)),
          knob: SpriteComponent.fromImage(knobImage, size: Vector2.all(radius / 2)),
        );
}
