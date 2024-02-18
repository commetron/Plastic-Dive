import 'package:plasticdiver/app/app.locator.dart';
import 'package:plasticdiver/services/shared_preferences_service.dart';
import 'package:plasticdiver/ui/views/settings/settings_view.form.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends FormViewModel with $SettingsView {
  final _sharedPreferencesService = locator<SharedPreferencesService>();

  SettingsViewModel() {
    // Initial value for the username field
    usernameController.text = username;
  }

  String get username => _sharedPreferencesService.username ?? '';

  Future updateUsername() async {
    _sharedPreferencesService.setUsername(usernameValue);
    rebuildUi();
  }

  Future clearSettings() async {
    await _sharedPreferencesService.clearPreferences();
    usernameController.text = username;
    rebuildUi();
  }
}
