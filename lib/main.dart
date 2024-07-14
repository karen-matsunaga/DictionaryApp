import 'package:dictionary/controllers/user_provider.dart';
import 'package:dictionary/models/dbhelper.dart';
import 'package:dictionary/models/users.dart';
import 'package:dictionary/views/login/signup_widget.dart';
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/views/profile/config_update_view.dart';
import 'package:dictionary/controllers/app_theme.dart';
import 'package:dictionary/controllers/darktheme_provider.dart';
import 'package:dictionary/views/home/homepage_widget.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/views/home/search_widget.dart';
import 'package:dictionary/views/login/login_widget.dart';
import 'package:provider/provider.dart' as provider;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DynamicDarkMode();
  await FontSizeConfig.loadFontSize();
  DatabaseHelper().initDatabase();

  runApp(
    provider.MultiProvider(providers: [
      // Aqui rodamos o app dentro do provider
      provider.ChangeNotifierProvider(create: (context) => FontSizeConfig()),
      provider.ChangeNotifierProvider(create: (context) => DynamicDarkMode()),
      provider.ChangeNotifierProvider(
          create: (context) => UserProvider()..loadUserData()),
    ], child: const CodexProgramador()),
  );
}

class CodexProgramador extends StatelessWidget {
  const CodexProgramador({super.key, Users? loggedInUser});
  @override
  Widget build(BuildContext context) {
    return provider.Consumer<DynamicDarkMode>(
      builder: (context, DynamicDarkMode themeProvider, child) {
        return MaterialApp(
          routes: {
            '/homepage': (_) => const HomePage(),
            '/search': (_) => const SearchPage(),
            '/menu': (_) => const MenuPage(),
            '/config': (_) => const MenuConfigurationPage(),
            '/signin': (_) => const LoginPage(),
            '/signup': (_) => const AccountCreatePage(),
          },

          // Tema do aplicativo
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
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
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        if (userProvider.username == null || userProvider.email == null) {
          return const LoginPage();
        } else {
          return const HomePage();
        }
      },
    );
  }
}
