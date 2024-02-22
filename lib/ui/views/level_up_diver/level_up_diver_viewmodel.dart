import 'package:plasticdiver/app/app.locator.dart';
import 'package:plasticdiver/services/diver_upgrade_service.dart';
import 'package:stacked/stacked.dart';

class LevelUpDiverViewModel extends BaseViewModel {
  final _diverUpgradeService = locator<DiverUpgradeService>();

  int get airTankLevel => _diverUpgradeService.airTankLevel;

  int get swimmingSpeedLevel => _diverUpgradeService.swimmingSpeedLevel;

  int get collectingSpeedLevel => _diverUpgradeService.collectingSpeedLevel;

  int get diveDepthLevel => _diverUpgradeService.diveDepthLevel;

  int get points => _diverUpgradeService.points;

  bool get isAirTankUpgradeAllowed => _diverUpgradeService.isAirTankUpgradeAllowed;

  bool get isSwimmingSpeedUpgradeAllowed => _diverUpgradeService.isSwimmingSpeedUpgradeAllowed;

  bool get isCollectingSpeedUpgradeAllowed => _diverUpgradeService.isCollectingSpeedUpgradeAllowed;

  bool get isDiveDepthUpgradeAllowed => _diverUpgradeService.isDiveDepthUpgradeAllowed;

  int get requiredPointsForAirTankUpgrade => _diverUpgradeService.requiredPointsForAirTankUpgrade;

  int get requiredPointsForSwimmingSpeedUpgrade => _diverUpgradeService.requiredPointsForSwimmingSpeedUpgrade;

  int get requiredPointsForCollectingSpeedUpgrade => _diverUpgradeService.requiredPointsForCollectingSpeedUpgrade;

  int get requiredPointsForDiveDepthUpgrade => _diverUpgradeService.requiredPointsForDiveDepthUpgrade;

  int get airTankLevelMax => _diverUpgradeService.airTankLevelMax;

  int get swimmingSpeedLevelMax => _diverUpgradeService.swimmingSpeedLevelMax;

  int get collectingSpeedLevelMax => _diverUpgradeService.collectingSpeedLevelMax;

  int get diveDepthLevelMax => _diverUpgradeService.diveDepthLevelMax;

  Future upgradeAirTank() async {
    await _diverUpgradeService.upgradeAirTank();
    rebuildUi();
  }

  Future upgradeSwimmingSpeed() async {
    await _diverUpgradeService.upgradeSwimmingSpeed();
    rebuildUi();
  }

  Future upgradeCollectingSpeed() async {
    await _diverUpgradeService.upgradeCollectingSpeed();
    rebuildUi();
  }

  Future upgradeDiveDepth() async {
    await _diverUpgradeService.upgradeDiveDepth();
    rebuildUi();
  }
}
