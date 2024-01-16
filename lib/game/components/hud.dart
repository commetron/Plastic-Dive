import 'package:flame/components.dart';
import 'package:flame/src/text/renderers/text_renderer.dart';
import 'package:flutter/cupertino.dart';

class Hud extends PositionComponent {
  late TextComponent<TextRenderer> scoreTextComponent;

  Hud({required ValueNotifier<int> scoreNotifier}) : super(size: Vector2(100, 100)) {
    // Add callback to update score text
    scoreNotifier.addListener(() {
      scoreTextComponent.text = 'Score: ${scoreNotifier.value}';
    });
  }
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(scoreTextComponent = TextComponent(text: 'Score: 0'));
  }
}
