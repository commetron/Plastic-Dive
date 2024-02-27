import 'package:flutter/material.dart';
import 'package:plasticdiver/ui/common/app_colors.dart';
import 'package:plasticdiver/ui/common/app_theme.dart';
import 'package:plasticdiver/ui/common/ui_helpers.dart';
import 'package:plasticdiver/ui/widgets/common/game_button/game_button.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/screens-backgrounds/home.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  right: 40,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kcPrimaryColor.withOpacity(0.7),
                          border: Border.all(color: Colors.white.withOpacity(0.7), width: 2),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text("Points: ${viewModel.points}", style: smallButtonTextStyle),
                            if (viewModel.isDiverUpgradable) ...[
                              horizontalSpaceMedium,
                              GameButton(
                                  onPressed: viewModel.navigateToLevelUpDiver, size: 30, child: Text("UPGRADE DIVER", style: smallButtonTextStyle)),
                            ]
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getResponsivePadding(context),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/icons/logo-no-background.png", width: quarterScreenWidth(context)),
                            Text("A game for \nGlobal Gamers Challenge", style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GameButton(
                                onPressed: viewModel.navigateToGame,
                                size: screenWidthFraction(context, dividedBy: 20),
                                child: const Text("PLAY", style: buttonTextStyle)),
                            verticalSpaceMedium,
                            GameButton(
                                onPressed: viewModel.navigateToHowToPlay,
                                size: screenWidthFraction(context, dividedBy: 20),
                                child: const Text("HOW-TO PLAY", style: buttonTextStyle)),
                            verticalSpaceMedium,
                            GameButton(
                                onPressed: viewModel.navigateToInfocean,
                                size: screenWidthFraction(context, dividedBy: 20),
                                child: const Text("INFOCEAN", style: buttonTextStyle)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          persistentFooterAlignment: AlignmentDirectional.center,
          persistentFooterButtons: [
            GameButton(
              onPressed: viewModel.switchSound,
              size: 50,
              child: viewModel.isSoundEnabled ? const Icon(Icons.volume_up, color: Colors.white) : const Icon(Icons.volume_off, color: Colors.white),
            ),
            horizontalSpaceMedium,
            GameButton(
              onPressed: viewModel.navigateToLeaderboard,
              size: 50,
              child: const Icon(Icons.leaderboard, color: Colors.white),
            ),
            horizontalSpaceMedium,
            GameButton(
              onPressed: viewModel.navigateToSettings,
              size: 50,
              child: const Icon(Icons.settings, color: Colors.white),
            ),
            horizontalSpaceMedium,
            GameButton(
              onPressed: viewModel.navigateToAbout,
              size: 50,
              child: const Icon(Icons.info_outline, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
