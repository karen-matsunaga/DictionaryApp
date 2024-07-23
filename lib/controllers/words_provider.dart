import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dictionary/models/words.dart';

// CARREGAMENTO DAS PALAVRAS
class WordsProvider with ChangeNotifier {
  List<Words> _words = [];

  List<Words> get words => _words;

  Future<void> loadWords() async {
    final prefs = await SharedPreferences.getInstance();
    final String? wordsString = prefs.getString('words');

    if (wordsString != null) {
      final List<dynamic> wordList = jsonDecode(wordsString);
      _words = wordList.map((e) => Words.fromJson(e)).toList();
    } else {
      await _loadWordsFromAsset();
    }

    notifyListeners();
  }

  // CARREGAR TODAS AS PALAVRAS
  Future<void> _loadWordsFromAsset() async {
    final String response =
        await rootBundle.loadString('assets/json/words.json');
    final wordData = await json.decode(response);
    var list = wordData["words"] as List<dynamic>;

    _words = list.map((e) => Words.fromJson(e)).toList();
    await _saveWordsToPrefs();
  }

  // SALVAR AS NOVAS PALAVRAS
  Future<void> _saveWordsToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String wordsString = jsonEncode(_words);
    await prefs.setString('words', wordsString);
  }

  // ATUALIZAR AS PALAVRAS EXISTENTES
  void updateWords(List<Words> newWords) {
    _words = newWords;
    _saveWordsToPrefs();
    notifyListeners();
  }
}
