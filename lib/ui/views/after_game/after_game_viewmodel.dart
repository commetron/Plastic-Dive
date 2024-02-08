import 'package:plasticdiver/app/app.locator.dart';
import 'package:plasticdiver/app/app.router.dart';
import 'package:plasticdiver/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AfterGameViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();

  int get highScore => _sharedPreferencesService.highScore;

  int get points => _sharedPreferencesService.points;

  Future replay() async {
    await _navigationService.replaceWithGameView();
  }

  Future navigateToHome() async {
    await _navigationService.replaceWithHomeView();
  }

  Future navigateToLeaderboard() async {
    await _navigationService.replaceWithLeaderboardView();
  }

  Future navigateToLevelUpDiver() async {
    await _navigationService.replaceWithLevelUpDiverView();
  }
}
