import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier {
  List<String> _words = [];
  List<String> get words => _words;

  FavoriteProvider() {
    _loadFavorites();
  }

  // CARREGAR OS FAVORITOS
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    _words = prefs.getStringList('favorites') ?? [];
    notifyListeners();
  }

  // SALVAR OS FAVORITOS
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', _words);
  }

  // DETECTOR DOS FAVORITOS
  void toggleFavorite(String word) {
    final isExist = _words.contains(word);
    if (isExist) {
      _words.remove(word);
    } else {
      _words.add(word);
    }
    _saveFavorites();
    notifyListeners();
  }

  // SE A PALAVRA CONTÉM NA LISTA DE FAVORITOS
  bool isExist(String word) {
    final isExist = _words.contains(word);
    return isExist;
  }

  // REMOVER OS FAVORITOS
  void clearFavorite() {
    _words = [];
    _saveFavorites();
    notifyListeners();
  }

  // RETORNAR OS DADOS DOS FAVORITOS
  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
