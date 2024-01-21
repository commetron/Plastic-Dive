import 'package:plastic_diver/app/app.locator.dart';
import 'package:plastic_diver/app/app.router.dart';
import 'package:plastic_diver/services/leaderboard_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GameViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _leaderboardService = locator<LeaderboardService>();

  Future onGameOver(bool isWon, int? score) async {
    if (isWon && score != null) {
      await _leaderboardService.addScore(LeaderboardEntry(pseudo: "TODO", score: score));
    }
    await _navigationService.replaceWithLeaderboardView();
  }
}
