import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// Iniciar o Supabase
// final client = Supabase.instance.client;

// ShowSnackBar customizado
extension ShowSnackBar on BuildContext {
  void showSnackBar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(color: Colors.redAccent),
        ),
      ),
    );
  }
}
