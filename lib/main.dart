import 'package:dictionary/controllers/user_provider.dart';
import 'package:dictionary/models/dbhelper.dart';
import 'package:dictionary/models/users.dart';
import 'package:dictionary/views/login/signup_widget.dart';
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/views/profile/config_update_view.dart';
import 'package:dictionary/controllers/theme.dart';
import 'package:dictionary/controllers/darktheme_provider.dart';
import 'package:dictionary/views/home/homepage_widget.dart';
import 'package:dictionary/views/profile/fav_widget.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/views/home/search_widget.dart';
import 'package:dictionary/views/login/login_widget.dart';
import 'package:provider/provider.dart' as provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TEMA DO APLICATIVO
  DynamicDarkMode();
  // TAMANHO DA FONTE
  await FontSizeConfig.loadFontSize();
  // USUÁRIO LOGADO
  await UserProvider().loadUserData();
  // SQFLITE - BANCO DE DADOS
  DatabaseHelper().initDatabase();

  runApp(
    provider.MultiProvider(
        providers: [
          // Aqui rodamos o app dentro do Provider onde serão carregadas as configurações salvas pelo Shared Preferences
          provider.ChangeNotifierProvider(
              create: (context) => FontSizeConfig()),
          provider.ChangeNotifierProvider(
              create: (context) => DynamicDarkMode()),
          provider.ChangeNotifierProvider(
              create: (context) => UserProvider()..loadUserData()),
        ],
        // ABERTURA DO APLICATIVO
        child: const CodexProgramador()),
  );
}

// ROTAS DE CADA PÁGINA DO APLICATIVO
class CodexProgramador extends StatelessWidget {
  const CodexProgramador({super.key, Users? loggedInUser});
  @override
  Widget build(BuildContext context) {
    return provider.Consumer<DynamicDarkMode>(
      builder: (context, DynamicDarkMode themeProvider, child) {
        // Rotas
        return MaterialApp(
          routes: {
            '/homepage': (_) => const HomePage(),
            '/search': (_) => SearchPage(),
            '/menu': (_) => const MenuPage(),
            '/config': (_) => const MenuConfigurationPage(),
            '/fav': (_) => FavoritePage(),
            '/signin': (_) => const LoginPage(),
            '/signup': (_) => const AccountCreatePage(),
          },

          // Tema do aplicativo
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          // Tela que sempre vai iniciar quando aberto
          home: const InitialScreen(),
          // home: const LoginPage(),
        );
      },
    );
  }
}

// TELA PARA DEFINIR SE O USUÁRIO ESTÁ LOGADO OU NÃO

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
