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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    verticalSpaceLarge,
                    Column(
                      children: [
                        Image.asset(
                            "assets/images/icons/logo-no-background.png",
                            height: thirdScreenHeight(context)),
                        verticalSpaceLarge,
                        GameButton(
                            onPressed: viewModel.navigateToGame,
                            size: 50,
                            child: const Text("PLAY", style: buttonTextStyle)),
                        verticalSpaceMedium,
                        GameButton(
                            onPressed: viewModel.navigateToPlastidex,
                            size: 50,
                            child: const Text("PLASTIDEX",
                                style: buttonTextStyle)),
                        verticalSpaceMedium,
                        GameButton(
                            onPressed: viewModel.navigateToLeaderboard,
                            size: 50,
                            child: const Text("LEADERBOARD",
                                style: buttonTextStyle)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: viewModel.switchSound,
                          icon: viewModel.isSoundEnabled
                              ? const Icon(Icons.volume_up)
                              : const Icon(Icons.volume_off),
                        ),
                        IconButton(
                          onPressed: viewModel.navigateToSettings,
                          icon: const Icon(Icons.settings),
                        ),
                        IconButton(
                          onPressed: viewModel.navigateToAbout,
                          icon: const Icon(Icons.info_outline),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
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
