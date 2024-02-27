import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';

class Score extends PositionComponent {
  int previousHighScore;
  late TextComponent<TextRenderer> scoreTextComponent;

  Score({
    required ValueNotifier<int> scoreNotifier,
    required this.previousHighScore,
  }) : super(size: Vector2(100, 100)) {
    // Add callback to update score text
    scoreNotifier.addListener(() {
      String scoreText = 'Score: ${scoreNotifier.value}';
      if (scoreNotifier.value > previousHighScore) {
        scoreText += ' (New high score!)';
      }

      scoreTextComponent.text = scoreText;
    });
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // TODO add a stamp for the high score

    add(
      scoreTextComponent = TextComponent(
        text: 'Score: 0',
        position: Vector2(10, 10),
        textRenderer: TextPaint(style: const TextStyle(fontFamily: 'PixeloidSans', fontSize: 25, color: Colors.white)),
      ),
    );
  }
}
