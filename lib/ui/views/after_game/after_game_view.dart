import 'package:flutter/material.dart';
import 'package:plasticdiver/ui/common/app_theme.dart';
import 'package:plasticdiver/ui/common/ui_helpers.dart';
import 'package:plasticdiver/ui/widgets/common/game_button/game_button.dart';
import 'package:stacked/stacked.dart';

import 'after_game_viewmodel.dart';

class AfterGameView extends StackedView<AfterGameViewModel> {
  final bool isWon;
  final int? score;

  const AfterGameView({required this.isWon, this.score, super.key});

  @override
  Widget builder(
    BuildContext context,
    AfterGameViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                isWon ? 'You won!' : 'You lost!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              if (isWon) ...[
                Text(
                  'New score: $score',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
              Text(
                'High score: ${viewModel.highScore}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Total points: ${viewModel.points}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              verticalSpaceMedium,
              GameButton(
                onPressed: viewModel.replay,
                size: 50,
                child: const Text('Replay', style: buttonTextStyle),
              ),
              verticalSpaceMedium,
              // TODO display only when the diver can level up
              GameButton(
                onPressed: viewModel.navigateToLevelUpDiver,
                size: 50,
                child: const Text('Level up diver', style: buttonTextStyle),
              ),
              verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GameButton(
                    onPressed: viewModel.navigateToLeaderboard,
                    size: 50,
                    child: const Icon(Icons.leaderboard, color: Colors.white),
                  ),
                  horizontalSpaceMedium,
                  GameButton(
                    onPressed: viewModel.navigateToHome,
                    size: 50,
                    child: const Icon(Icons.home, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  AfterGameViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AfterGameViewModel();
}
