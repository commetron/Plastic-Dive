import 'package:dive_game/constants.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class Joystick extends JoystickComponent {
  static const double radius = 75;
  static final knobPaint = BasicPalette.blue.withAlpha(200).paint();
  static final backgroundPaint = BasicPalette.blue.withAlpha(100).paint();

  Joystick()
      : super(
          anchor: Anchor.bottomLeft,
          knob: CircleComponent(radius: radius / 3, paint: knobPaint),
          background: CircleComponent(radius: radius, paint: backgroundPaint),
          position: Vector2(20, Constants.gameHeight - 20),
        );
}
