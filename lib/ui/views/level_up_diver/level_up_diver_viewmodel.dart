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

  get isAirTankUpgradeAllowed => points >= Constants.pointsNeededToUpgradeSkills[airTankLevel];

  get isSwimmingSpeedUpgradeAllowed => points >= Constants.pointsNeededToUpgradeSkills[swimmingSpeedLevel];

  get isCollectingSpeedUpgradeAllowed => points >= Constants.pointsNeededToUpgradeSkills[collectingSpeedLevel];

  get isDiveDepthUpgradeAllowed => points >= Constants.pointsNeededToUpgradeSkills[diveDepthLevel];

  Future upgradeAirTank() async {
    await _sharedPreferencesService.addPoints(-Constants.pointsNeededToUpgradeSkills[airTankLevel]);
    await _sharedPreferencesService.upgradeAirTank();
    rebuildUi();
  }

  Future upgradeSwimmingSpeed() async {
    await _sharedPreferencesService.addPoints(-Constants.pointsNeededToUpgradeSkills[swimmingSpeedLevel]);
    _sharedPreferencesService.upgradeSwimmingSpeed();
    rebuildUi();
  }

  Future upgradeCollectingSpeed() async {
    await _sharedPreferencesService.addPoints(-Constants.pointsNeededToUpgradeSkills[collectingSpeedLevel]);
    _sharedPreferencesService.upgradeCollectingSpeed();
    rebuildUi();
  }

  Future upgradeDiveDepth() async {
    await _sharedPreferencesService.addPoints(-Constants.pointsNeededToUpgradeSkills[diveDepthLevel]);
    _sharedPreferencesService.upgradeDiveDepth();
    rebuildUi();
  }
}
