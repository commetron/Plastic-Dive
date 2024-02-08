import 'package:plasticdiver/app/app.locator.dart';
import 'package:plasticdiver/app/app.router.dart';
import 'package:plasticdiver/services/leaderboard_service.dart';
import 'package:plasticdiver/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GameViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _leaderboardService = locator<LeaderboardService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();

  int get points => _sharedPreferencesService.points;

  int get highScore => _sharedPreferencesService.highScore;

  int get airTankLevel => _sharedPreferencesService.airTankLevel;

  int get swimmingSpeedLevel => _sharedPreferencesService.swimmingSpeedLevel;

  int get collectingSpeedLevel =>
      _sharedPreferencesService.collectingSpeedLevel;

  int get diveDepthLevel => _sharedPreferencesService.diveDepthLevel;

  bool get isSoundEnabled => _sharedPreferencesService.isSoundEnabled;

  Future onGameOver(bool isWon, int? score) async {
    if (isWon && score != null) {
      await _sharedPreferencesService.addPoints(score);
      await _leaderboardService.addScore(LeaderboardEntry(
          pseudo: _sharedPreferencesService.username, score: score));
    }
    await _navigationService.replaceWithAfterGameView(
        isWon: isWon, score: score);
  }
}
