import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/text.dart';
import 'package:plasticdiver/constants.dart';

class CollectButton extends SpriteButtonComponent {
  static const double buttonWidth = 200;
  static const double buttonHeight = 100;

  final TextComponent timeText = TextComponent(
    text: 'Collect',
    textRenderer: TextPaint(style: const TextStyle(fontFamily: 'PixeloidSans', fontSize: 20)),
    position: Vector2(buttonWidth / 2, buttonHeight / 2 - 7),
    anchor: Anchor.center,
  );

  CollectButton()
      : super(
          size: Vector2(buttonWidth, buttonHeight),
          position: Vector2(Constants.gameWidth - 20, Constants.gameHeight - 20),
          anchor: Anchor.bottomRight,
        );

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    add(timeText);

    disable(); // Disable button by default
  }

  FutureOr<void> disable() async {
    button = await Sprite.load('ui/button-disabled.png');
    buttonDown = await Sprite.load('ui/button-disabled.png');
    timeText.text = "Collect";
  }

  FutureOr<void> enable({required int collectionTimeInSeconds}) async {
    button = await Sprite.load('ui/button-up.png');
    buttonDown = await Sprite.load('ui/button-down.png');
    timeText.text = "Collect ${collectionTimeInSeconds}s";
  }
}
