import 'package:flutter/material.dart';
import 'package:plasticdiver/ui/common/ui_helpers.dart';
import 'package:plasticdiver/ui/widgets/common/level_bar/level_bar.dart';
import 'package:stacked/stacked.dart';

import 'level_up_diver_viewmodel.dart';

class LevelUpDiverView extends StackedView<LevelUpDiverViewModel> {
  const LevelUpDiverView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LevelUpDiverViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Level up diver'),
      ),
      body: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total points: ${viewModel.points}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              verticalSpaceLarge,
              LevelBar(
                skillName: 'Air tank',
                level: viewModel.airTankLevel,
                isUpgradeAllowed: viewModel.isAirTankUpgradeAllowed,
                onUpgrade: viewModel.upgradeAirTank,
              ),
              verticalSpaceMedium,
              LevelBar(
                skillName: 'Swim speed',
                level: viewModel.swimmingSpeedLevel,
                isUpgradeAllowed: viewModel.isSwimmingSpeedUpgradeAllowed,
                onUpgrade: viewModel.upgradeSwimmingSpeed,
              ),
              verticalSpaceMedium,
              LevelBar(
                skillName: 'Collecting speed',
                level: viewModel.collectingSpeedLevel,
                isUpgradeAllowed: viewModel.isCollectingSpeedUpgradeAllowed,
                onUpgrade: viewModel.upgradeCollectingSpeed,
              ),
              verticalSpaceMedium,
              LevelBar(
                skillName: 'Dive depth',
                level: viewModel.diveDepthLevel,
                isUpgradeAllowed: viewModel.isDiveDepthUpgradeAllowed,
                onUpgrade: viewModel.upgradeDiveDepth,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LevelUpDiverViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LevelUpDiverViewModel();
}
