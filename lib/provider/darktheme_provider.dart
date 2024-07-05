import 'package:dictionary/controllers/mytheme_preference.dart';
import 'package:flutter/material.dart';

class DynamicDarkMode extends ChangeNotifier {
  late bool _isDarkMode;
  late MyThemePreferences _preferences;
  bool get isDarkMode => _isDarkMode;

  DynamicDarkMode() {
    _isDarkMode = false;
    _preferences = MyThemePreferences();
    getPreferences();
  }

  // Trocar os TEMAS CLARO / ESCURO
  set isDarkMode(bool value) {
    _isDarkMode = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  // Salvar o tema escolhido
  getPreferences() async {
    _isDarkMode = await _preferences.getTheme();
    notifyListeners();
  }
}
