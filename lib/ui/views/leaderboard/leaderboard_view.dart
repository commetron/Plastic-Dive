import 'package:flutter/material.dart';
import 'package:plasticdiver/services/leaderboard_service.dart';
import 'package:plasticdiver/ui/common/ui_helpers.dart';
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
    return Stack(
      children: [
        Image.asset(
          "assets/images/screens-backgrounds/home.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text('🏆 Leaderboard 🏆'),
          ),
          body: Container(
            padding: getResponsivePadding(context),
            child: viewModel.isBusy
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : viewModel.data == null
                    ? Center(child: Text("Impossible to load the leaderboard 😅", style: Theme.of(context).textTheme.titleMedium))
                    : ListView.builder(
                        itemCount: viewModel.data!.length,
                        itemBuilder: (context, index) {
                          final LeaderboardEntry entry = viewModel.data![index];
                          return ListTile(
                            leading: Text(
                              '#${index + 1}',
                              style: index < 3 ? Theme.of(context).textTheme.titleLarge : Theme.of(context).textTheme.titleMedium,
                            ),
                            title: Text(
                              entry.pseudo,
                              // TODO display skills "${entry.pseudo} (${entry.diveDepthLevel}/${entry.collectingSpeedLevel}/${entry.airTankLevel}/${entry.swimmingSpeedLevel})",
                              style: index < 3 ? Theme.of(context).textTheme.titleLarge : Theme.of(context).textTheme.titleMedium,
                            ),
                            trailing: Text(
                              '${entry.score}',
                              style: index < 3 ? Theme.of(context).textTheme.titleLarge : Theme.of(context).textTheme.titleMedium,
                            ),
                          );
                        },
                      ),
          ),
        ),
      ],
    );
  }

  @override
  LeaderboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LeaderboardViewModel();
}
