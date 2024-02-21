import 'package:plasticdiver/app/app.locator.dart';
import 'package:plasticdiver/constants.dart';
import 'package:plasticdiver/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';

class LevelUpDiverViewModel extends BaseViewModel {
  final _sharedPreferencesService = locator<SharedPreferencesService>();

  int get airTankLevel => _sharedPreferencesService.airTankLevel;

  int get swimmingSpeedLevel => _sharedPreferencesService.swimmingSpeedLevel;

  int get collectingSpeedLevel => _sharedPreferencesService.collectingSpeedLevel;

  int get diveDepthLevel => _sharedPreferencesService.diveDepthLevel;

  int get points => _sharedPreferencesService.points;

  bool get isAirTankUpgradeAllowed => points >= requiredPointsForAirTankUpgrade;

  bool get isSwimmingSpeedUpgradeAllowed => points >= requiredPointsForSwimmingSpeedUpgrade;

  bool get isCollectingSpeedUpgradeAllowed => points >= requiredPointsForCollectingSpeedUpgrade;

  bool get isDiveDepthUpgradeAllowed => points >= requiredPointsForDiveDepthUpgrade;

  int get requiredPointsForAirTankUpgrade => airTankLevel < airTankLevelMax ? Constants.requiredPointsToUpgradeSkills[airTankLevel + 1] : 0;

  int get requiredPointsForSwimmingSpeedUpgrade =>
      swimmingSpeedLevel < swimmingSpeedLevelMax ? Constants.requiredPointsToUpgradeSkills[swimmingSpeedLevel + 1] : 0;

  int get requiredPointsForCollectingSpeedUpgrade =>
      collectingSpeedLevel < collectingSpeedLevelMax ? Constants.requiredPointsToUpgradeSkills[collectingSpeedLevel + 1] : 0;

  int get requiredPointsForDiveDepthUpgrade => diveDepthLevel < diveDepthLevelMax ? Constants.requiredPointsToUpgradeSkills[diveDepthLevel + 1] : 0;

  int get airTankLevelMax => Constants.requiredPointsToUpgradeSkills.length - 1;

  int get swimmingSpeedLevelMax => Constants.requiredPointsToUpgradeSkills.length - 1;

  int get collectingSpeedLevelMax => Constants.requiredPointsToUpgradeSkills.length - 1;

  int get diveDepthLevelMax => Constants.requiredPointsToUpgradeSkills.length - 1;

  Future upgradeAirTank() async {
    await _sharedPreferencesService.addPoints(-Constants.requiredPointsToUpgradeSkills[airTankLevel]);
    await _sharedPreferencesService.upgradeAirTank();
    rebuildUi();
  }

  Future upgradeSwimmingSpeed() async {
    await _sharedPreferencesService.addPoints(-Constants.requiredPointsToUpgradeSkills[swimmingSpeedLevel]);
    _sharedPreferencesService.upgradeSwimmingSpeed();
    rebuildUi();
  }

  Future upgradeCollectingSpeed() async {
    await _sharedPreferencesService.addPoints(-Constants.requiredPointsToUpgradeSkills[collectingSpeedLevel]);
    _sharedPreferencesService.upgradeCollectingSpeed();
    rebuildUi();
  }

  Future upgradeDiveDepth() async {
    await _sharedPreferencesService.addPoints(-Constants.requiredPointsToUpgradeSkills[diveDepthLevel]);
    _sharedPreferencesService.upgradeDiveDepth();
    rebuildUi();
  }
}
