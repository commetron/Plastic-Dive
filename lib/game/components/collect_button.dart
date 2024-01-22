import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:plasticdiver/constants.dart';

class CollectButton extends SpriteButtonComponent {
  CollectButton()
      : super(
          children: [TextComponent(text: 'Collect')],
          position: Vector2(Constants.gameWidth - 20, Constants.gameHeight - 20),
          anchor: Anchor.bottomRight,
        );

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    button = await Sprite.load('ui/button.png');
    buttonDown = await Sprite.load('ui/button_down.png');
  }
}
