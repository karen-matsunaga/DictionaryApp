// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:dictionary/authentication/signup_page.dart';
import 'package:dictionary/provider/fontsize-provider.dart';
import 'package:dictionary/menu/menu_page.dart';
import 'package:dictionary/menu/favorite_page.dart';
import 'package:dictionary/menu/configuration_page.dart';
import 'package:dictionary/controllers/app-theme.dart';
import 'package:dictionary/provider/darktheme-provider.dart';
import 'package:dictionary/homepage/homepage_page.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/homepage/search_page.dart';
import 'package:dictionary/authentication/login_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DynamicDarkMode();
  await FontSizeConfig.loadFontSize();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => FontSizeConfig()),
      // Aqui rodamos o app dentro do provider
      ChangeNotifierProvider(create: (context) => DynamicDarkMode()),
    ], child: CodexProgramador()),
  );
}

class CodexProgramador extends StatelessWidget {
  const CodexProgramador({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<DynamicDarkMode>(
      builder: (context, DynamicDarkMode themeProvider, child) {
        return MaterialApp(
          routes: {
            '/homepage': (context) => HomeSearchPage(),
            '/search': (context) => DictionarySearchPage(),
            '/favorite': (context) => FavoritePage(),
            '/menu': (context) => HomePage(),
            '/config': (context) => MenuConfigurationPage(),
            '/signin': (context) => LoginPage(),
            '/signup': (context) => AccountCreatePage(),
          },

          // Tema do aplicativo
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,

          home: LoginPage(),
        );
      },
    );
  }
}
