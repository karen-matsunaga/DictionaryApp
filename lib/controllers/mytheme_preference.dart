import 'package:shared_preferences/shared_preferences.dart';

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
