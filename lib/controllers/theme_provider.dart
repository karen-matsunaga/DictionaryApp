import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

// SALVAR O TEMA ESCOLHIDO
class MyThemePreferences {
  static const _key = "theme_key";

  // ACESSAR O TEMA ESCOLHIDO
  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_key, value);
  }

  // SALVAR O TEMA ESCOLHIDO
  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_key) ?? false;
  }
}

// SALVAR OS TEMAS LIGHT E DARK COM SHARED PREFERENCES
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
