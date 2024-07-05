import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontSizeConfig with ChangeNotifier {
  static const String _key = 'fontSize';
  static double _fontSize = 16.0;
  double get fontSize => _fontSize;

  // SALVAR O TAMANHO DA FONTE
  Future<void> saveFontSize(double size) async {
    final prefs = await SharedPreferences.getInstance();
    _fontSize = size;
    prefs.setDouble(_key, size);
  }

  // CARREGAR O TAMANHO DA FONTE
  static Future<void> loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_key)) {
      _fontSize = prefs.getDouble(_key) ?? _fontSize;
    }
  }
}
