import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'leaderboard_viewmodel.dart';

class LeaderboardView extends StackedView<LeaderboardViewModel> {
  const LeaderboardView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LeaderboardViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('🏆 Leaderboard 🏆'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: viewModel.isBusy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: viewModel.data!.length,
                itemBuilder: (context, index) {
                  final entry = viewModel.data![index];
                  return ListTile(
                    leading: Text(
                      '#${index + 1}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    title: Text(
                      entry.pseudo,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    trailing: Text(
                      '${entry.score}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  );
                },
              ),
      ),
    );
  }

  @override
  LeaderboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LeaderboardViewModel();
}
