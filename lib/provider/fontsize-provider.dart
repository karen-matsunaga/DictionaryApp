// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, file_names, prefer_conditional_assignment, unnecessary_null_comparison, prefer_final_fields
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontSizeConfig with ChangeNotifier {
  static String _key = 'fontSize';
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
