// TELA PARA DEFINIR SE O USUÁRIO ESTÁ LOGADO OU NÃO
import 'package:dictionary/controllers/user_provider.dart';
import 'package:dictionary/views/home/homepage_widget.dart';
import 'package:dictionary/views/login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return provider.Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        if (userProvider.email == null) {
          // SE TIVER LOGADO
          return const LoginPage();
        } else {
          // SE NÃO TIVER LOGADO
          return const HomePage();
        }
      },
    );
  }
}
