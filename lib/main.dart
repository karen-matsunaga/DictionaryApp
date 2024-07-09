import 'package:dictionary/models/dbhelper.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DynamicDarkMode();
  await FontSizeConfig.loadFontSize();
  DatabaseHelper();
  runApp(
    provider.MultiProvider(providers: [
      provider.ChangeNotifierProvider(create: (context) => FontSizeConfig()),
      // Aqui rodamos o app dentro do provider
      provider.ChangeNotifierProvider(create: (context) => DynamicDarkMode()),
    ], child: const CodexProgramador()),
  );
}

class CodexProgramador extends StatelessWidget {
  const CodexProgramador({super.key});
  @override
  Widget build(BuildContext context) {
    return provider.Consumer<DynamicDarkMode>(
      builder: (context, DynamicDarkMode themeProvider, child) {
        return MaterialApp(
          routes: {
            '/homepage': (_) => const HomeSearchPage(),
            '/search': (_) => const DictionarySearchPage(),
            '/menu': (_) => const HomePage(),
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

          home: const LoginPage(),
        );
      },
    );
  }
}
