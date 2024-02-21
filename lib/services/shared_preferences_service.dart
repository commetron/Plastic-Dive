import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';

class SharedPreferencesService extends InitializableDependency {
  late SharedPreferences _preferences;

  @override
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static const _hasSeenHowToPlayKey = 'hasSeenHowToPlay';

  bool get hasSeenHowToPlay => _getFromDisk(_hasSeenHowToPlayKey) ?? false;

  setHasSeenHowToPlay(bool value) async => await _saveToDisk(_hasSeenHowToPlayKey, value);

  static const _usernameKey = 'username';

  String get username => _getFromDisk(_usernameKey) ?? 'Diver';

  setUsername(String? value) async => await _saveToDisk(_usernameKey, value);

  static const _highScoreKey = 'highScore';

  int get highScore => _getFromDisk(_highScoreKey) ?? 0;

  setHighScore(int? value) async => await _saveToDisk(_highScoreKey, value);

  static const _pointsKey = 'points';

  int get points => _getFromDisk(_pointsKey) ?? 0;

  addPoints(int value) async {
    value += points;
    await _saveToDisk(_pointsKey, value);
  }

  static const _airTankLevelKey = 'airTankLevel';

  int get airTankLevel => _getFromDisk(_airTankLevelKey) ?? 1;

  setAirTankLevel(int value) async => await _saveToDisk(_airTankLevelKey, value);

  static const _swimmingSpeedLevelKey = 'swimmingSpeedLevel';

  int get swimmingSpeedLevel => _getFromDisk(_swimmingSpeedLevelKey) ?? 1;

  setSwimmingSpeedLevel(int value) async => await _saveToDisk(_swimmingSpeedLevelKey, value);

  static const _collectingSpeedLevelKey = 'collectingSpeedLevel';

  int get collectingSpeedLevel => _getFromDisk(_collectingSpeedLevelKey) ?? 1;

  setCollectingSpeedLevel(int value) async => await _saveToDisk(_collectingSpeedLevelKey, value);

  static const _diveDepthLevelKey = 'diveDepthLevel';

  int get diveDepthLevel => _getFromDisk(_diveDepthLevelKey) ?? 1;

  setDiveDepthLevel(int value) async => await _saveToDisk(_diveDepthLevelKey, value);

  static const _isSoundEnabledKey = 'isSoundEnabled';

  bool get isSoundEnabled => _getFromDisk(_isSoundEnabledKey) ?? true;

  toggleSoundEnabled() async => await _saveToDisk(_isSoundEnabledKey, !isSoundEnabled);

  Future clearPreferences() async {
    await _preferences.clear();
  }

  dynamic _getFromDisk(String key) {
    var value = _preferences.get(key);
    return value;
  }

  Future _saveToDisk(String key, dynamic content) async {
    if (content is String) {
      await _preferences.setString(key, content);
    }
    if (content is bool) {
      await _preferences.setBool(key, content);
    }
    if (content is int) {
      await _preferences.setInt(key, content);
    }
    if (content is double) {
      await _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      await _preferences.setStringList(key, content);
    }
  }

  Future upgradeAirTank() async {
    await setAirTankLevel(airTankLevel + 1);
  }

  Future upgradeSwimmingSpeed() async {
    await setSwimmingSpeedLevel(swimmingSpeedLevel + 1);
  }

  Future upgradeCollectingSpeed() async {
    await setCollectingSpeedLevel(collectingSpeedLevel + 1);
  }

  Future upgradeDiveDepth() async {
    await setDiveDepthLevel(diveDepthLevel + 1);
  }
}
