import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:plastic_diver/game/dive_game.dart';
import 'package:stacked/stacked.dart';

import 'game_viewmodel.dart';

class GameView extends StackedView<GameViewModel> {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    GameViewModel viewModel,
    Widget? child,
  ) {
    return GameWidget(
      game: DiveGame(),
      autofocus: true,
    );
  }

  @override
  GameViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GameViewModel();
}
