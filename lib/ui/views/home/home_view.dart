import 'package:flutter/material.dart';
import 'package:plastic_diver/ui/common/ui_helpers.dart';
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
    return Scaffold(
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
                    OutlinedButton(onPressed: viewModel.navigateToGame, child: const Text("Play!")),
                    verticalSpaceMedium,
                    OutlinedButton(onPressed: viewModel.navigateToPlastidex, child: const Text("Plastidex")),
                    verticalSpaceMedium,
                    OutlinedButton(onPressed: viewModel.navigateToLeaderboard, child: const Text("Leaderboard")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: viewModel.switchSound,
                      icon: const Icon(Icons.volume_off),
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
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
