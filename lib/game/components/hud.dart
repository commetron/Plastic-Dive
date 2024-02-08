import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:flutter/cupertino.dart';

class Hud extends PositionComponent {
  late TextComponent<TextRenderer> scoreTextComponent;
  late TextComponent<TextRenderer> diveDepthTextComponent;
  late TextComponent<TextRenderer> countdownTextComponent;

  Hud(
      {required ValueNotifier<int> scoreNotifier,
      required ValueNotifier<double> diveDepthNotifier,
      required ValueNotifier<double> remainingTime})
      : super(size: Vector2(100, 100)) {
    // Add callback to update score text
    scoreNotifier.addListener(() {
      scoreTextComponent.text = 'Score: ${scoreNotifier.value}';
    });

    diveDepthNotifier.addListener(() {
      diveDepthTextComponent.text =
          'Dive depth: ${diveDepthNotifier.value.toStringAsFixed(2)}m';
    });

    remainingTime.addListener(() {
      countdownTextComponent.text =
          'Time: ${remainingTime.value < 0 ? "0.00s" : remainingTime.value.toStringAsFixed(2)}s';
    });
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(scoreTextComponent =
        TextComponent(text: 'Score: 0', position: Vector2(0, 0)));
    add(diveDepthTextComponent =
        TextComponent(text: 'Dive depth: 0.00m', position: Vector2(0, 20)));
    add(countdownTextComponent =
        TextComponent(text: 'Time: TODOs', position: Vector2(0, 40)));
  }
}
