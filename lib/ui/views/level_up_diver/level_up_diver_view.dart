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
      body: Padding(
        padding: const EdgeInsets.all(10),
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
                requiredPointsToUpgrade: viewModel.requiredPointsForAirTankUpgrade,
                maxLevel: viewModel.airTankLevelMax,
              ),
              verticalSpaceMedium,
              LevelBar(
                skillName: 'Swim speed',
                level: viewModel.swimmingSpeedLevel,
                isUpgradeAllowed: viewModel.isSwimmingSpeedUpgradeAllowed,
                onUpgrade: viewModel.upgradeSwimmingSpeed,
                requiredPointsToUpgrade: viewModel.requiredPointsForSwimmingSpeedUpgrade,
                maxLevel: viewModel.swimmingSpeedLevelMax,
              ),
              verticalSpaceMedium,
              LevelBar(
                skillName: 'Collecting speed',
                level: viewModel.collectingSpeedLevel,
                isUpgradeAllowed: viewModel.isCollectingSpeedUpgradeAllowed,
                onUpgrade: viewModel.upgradeCollectingSpeed,
                requiredPointsToUpgrade: viewModel.requiredPointsForCollectingSpeedUpgrade,
                maxLevel: viewModel.collectingSpeedLevelMax,
              ),
              verticalSpaceMedium,
              LevelBar(
                skillName: 'Dive depth',
                level: viewModel.diveDepthLevel,
                isUpgradeAllowed: viewModel.isDiveDepthUpgradeAllowed,
                onUpgrade: viewModel.upgradeDiveDepth,
                requiredPointsToUpgrade: viewModel.requiredPointsForDiveDepthUpgrade,
                maxLevel: viewModel.diveDepthLevelMax,
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
