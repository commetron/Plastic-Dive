import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:plasticdiver/game/dive_game.dart';
import 'package:stacked/stacked.dart';

import 'game_viewmodel.dart';

class GameView extends StackedView<GameViewModel> {
  const GameView({super.key});

  @override
  Widget builder(
    BuildContext context,
    GameViewModel viewModel,
    Widget? child,
  ) {
    return GameWidget(
      game: DiveGame(
        onGameOver: viewModel.onGameOver,
        airTankLevel: viewModel.airTankLevel,
        collectingSpeedLevel: viewModel.collectingSpeedLevel,
        diveDepthLevel: viewModel.diveDepthLevel,
        swimmingSpeedLevel: viewModel.swimmingSpeedLevel,
        highScore: viewModel.highScore,
        isSoundEnabled: viewModel.isSoundEnabled,
      ),
      autofocus: true,
    );
  }

  @override
  GameViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GameViewModel();
}
