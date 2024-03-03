import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flame/text.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:plasticdive/constants.dart';
import 'package:plasticdive/game/dive_game.dart';

class PauseButton extends SpriteButtonComponent with HasGameRef<DiveGame> {
  static const double buttonWidth = 200;
  static const double buttonHeight = 100;

  PauseButton()
      : super(
          size: Vector2(buttonWidth, buttonHeight),
          position: Vector2(Constants.gameWidth - 20, 0),
          anchor: Anchor.topRight,
          children: [
            TextComponent(
              text: 'PAUSE',
              textRenderer: TextPaint(style: const TextStyle(fontFamily: 'PixeloidSans', fontSize: 20, color: Colors.white)),
              position: Vector2(buttonWidth / 2, buttonHeight / 2 - 7),
              anchor: Anchor.center,
            )
          ],
        );

  @override
  Future<dynamic> onLoad() async {
    button = await Sprite.load('ui/button-disabled.png');
    buttonDown = await Sprite.load('ui/button-disabled.png');
  }

  @override
  void onTapDown(TapDownEvent _) {
    super.onTapDown(_);
    FlameAudio.bgm.pause();
    game.overlays.add('PauseMenu');
    game.pauseEngine();
  }
}
