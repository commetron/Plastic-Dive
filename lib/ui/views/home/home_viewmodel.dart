import 'package:plasticdiver/app/app.locator.dart';
import 'package:plasticdiver/app/app.router.dart';
import 'package:plasticdiver/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();

  bool get isSoundEnabled => _sharedPreferencesService.isSoundEnabled;

  Future switchSound() async {
    await _sharedPreferencesService.toggleSoundEnabled();
    rebuildUi();
  }

  Future navigateToGame() async {
    if (!_sharedPreferencesService.hasSeenHowToPlay) {
      return await _routerService.navigateToHowToPlayView(goToGameOnComplete: true);
    }

    return await _routerService.navigateToGameView();
  }

  Future navigateToHowToPlay() async {
    return await _routerService.navigateToHowToPlayView(goToGameOnComplete: false);
  }

  Future navigateToSettings() async {
    await _routerService.navigateToSettingsView();
    rebuildUi(); // Make sure the sound icon is updated
  }

  Future navigateToAbout() async {
    return await _routerService.navigateToAboutView();
  }

  Future navigateToInfocean() async {
    return await _routerService.navigateToInfoceanView();
  }

  Future navigateToLeaderboard() async {
    return await _routerService.navigateToLeaderboardView();
  }

  Future navigateToLevelUpDiver() async {
    await _routerService.navigateToLevelUpDiverView();
  }
}
