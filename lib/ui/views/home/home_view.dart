import 'package:flutter/material.dart';
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
                      Chip(label: Text("Score: ${viewModel.points}")),
                      GameButton(onPressed: viewModel.navigateToLevelUpDiver, size: 30, child: Text("UPGRADE DIVER", style: smallButtonTextStyle)),
                    ],
                  ),
                ),
                Padding(
                  padding: getResponsivePadding(context),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/icons/logo-no-background.png", height: quarterScreenHeight(context)),
                        verticalSpaceLarge,
                        GameButton(onPressed: viewModel.navigateToGame, size: 75, child: const Text("PLAY", style: buttonTextStyle)),
                        verticalSpaceMedium,
                        GameButton(onPressed: viewModel.navigateToHowToPlay, size: 50, child: const Text("HOW-TO PLAY", style: buttonTextStyle)),
                        verticalSpaceMedium,
                        GameButton(onPressed: viewModel.navigateToInfocean, size: 50, child: const Text("INFOCEAN", style: buttonTextStyle)),
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
