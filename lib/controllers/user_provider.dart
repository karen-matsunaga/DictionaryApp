import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  String? _userName;
  String? _email;

  String? get userName => _userName;
  String? get email => _email;

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userName = prefs.getString('userName');
    _email = prefs.getString('email');
    notifyListeners();
  }

  Future<void> saveUserData(String userName, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userName);
    await prefs.setString('email', email);
    _userName = userName;
    _email = email;
    notifyListeners();
  }

  Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userName');
    await prefs.remove('email');
    _userName = null;
    _email = null;
    notifyListeners();
  }
}
