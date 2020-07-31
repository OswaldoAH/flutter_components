import 'package:examples/src/data/model/preferences_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepository {
  static const THEME = 'theme';

  static final PreferencesRepository _instance =
      PreferencesRepository._internal();
  SharedPreferences _preferences;

  factory PreferencesRepository() => _instance;

  PreferencesRepository._internal();

  initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  PreferencesModel get data {
    return PreferencesModel(
      isDark: _preferences.getBool(THEME)??false,
    );
  }

  Future<bool> changeTheme(bool theme) async =>
      await _preferences.setBool(THEME, theme);
}
