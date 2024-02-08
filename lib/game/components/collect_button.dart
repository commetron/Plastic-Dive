import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/text.dart';
import 'package:plasticdiver/constants.dart';

class CollectButton extends SpriteButtonComponent {
  CollectButton()
      : super(
          children: [TextComponent(text: 'Collect', textRenderer: TextPaint(style: const TextStyle(fontFamily: 'PressStart2P')))],
          position: Vector2(Constants.gameWidth - 20, Constants.gameHeight - 20),
          anchor: Anchor.bottomRight,
        );

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    disable(); // Disable button by default
  }

  setCollectingTime(double time) {
    // TODO change the text to show the time
  }

  FutureOr<void> disable() async {
    button = await Sprite.load('ui/button-disabled.png');
    buttonDown = await Sprite.load('ui/button-disabled.png');
  }

  FutureOr<void> enable() async {
    button = await Sprite.load('ui/button-up.png');
    buttonDown = await Sprite.load('ui/button-down.png');
  }
}
