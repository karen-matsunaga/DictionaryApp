import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// E-MAIL DO USUÁRIO EXIBIDO NO DRAWER DE MENU DO APLICATIVO COM O PROVIDER
class UserProvider with ChangeNotifier {
  // E-MAIL LOGADO
  String? _email;
  // RECUPERAR O E-MAIL LOGADO
  String? get email => _email;

  // CARREGAR O E-MAIL DO USUÁRIO LOGADO
  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _email = prefs.getString('email');
    notifyListeners();
  }

  // SALVAR O E-MAIL DO USUÁRIO LOGADO
  Future<void> saveUserData(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    _email = email;
    notifyListeners();
  }

  // REMOVER O E-MAIL DO USUÁRIO DESLOGADO
  Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    _email = null;
    notifyListeners();
  }
}
