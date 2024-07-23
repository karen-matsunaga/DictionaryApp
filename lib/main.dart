import 'package:dictionary/controllers/custom_theme.dart';
import 'package:dictionary/controllers/user_provider.dart';
import 'package:dictionary/controllers/words_provider.dart';
import 'package:dictionary/models/dbhelper.dart';
import 'package:dictionary/models/users.dart';
import 'package:dictionary/views/login/signup_screen.dart';
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/views/profile/config_view.dart';
import 'package:dictionary/controllers/theme_provider.dart';
import 'package:dictionary/views/home/homepage_screen.dart';
import 'package:dictionary/views/profile/fav_screen.dart';
import 'package:dictionary/views/login/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/views/home/search_screen.dart';
import 'package:dictionary/views/login/login_screen.dart';
import 'package:provider/provider.dart' as provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TEMA DO APLICATIVO
  DynamicDarkMode();
  // TAMANHO DA FONTE
  await FontSizeConfig.loadFontSize();
  // USUÁRIO LOGADO
  UserProvider();
  // ARQUIVO WORDS.JSON
  WordsProvider();
  // SQFLITE - BANCO DE DADOS
  final dbHelper = DatabaseHelper();

  // Aqui rodamos o app dentro do Provider onde serão carregadas as configurações salvas pelo Shared Preferences, Provider e SQFLite
  runApp(
    provider.MultiProvider(
        providers: [
          // TAMANHO DA FONTE
          provider.ChangeNotifierProvider(
              create: (context) => FontSizeConfig()),
          // TEMA LIGHT/DARK
          provider.ChangeNotifierProvider(
              create: (context) => DynamicDarkMode()),
          // USUÁRIO LOGADO
          provider.ChangeNotifierProvider(
              create: (context) => UserProvider()..loadUserData()),
          // CARREGAMENTO DAS PALAVRAS DA CLASSE WORDS BASEADO NO WORDS.JSON
          provider.ChangeNotifierProvider(create: (context) => WordsProvider()),
          // BANCO DE DADOS SQFLITE ATIVADO
          provider.Provider<DatabaseHelper>.value(value: dbHelper),
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
            '/search': (_) => const SearchPage(),
            '/menu': (_) => const MenuPage(),
            '/config': (_) => const MenuConfigurationPage(),
            '/fav': (_) => FavoritePage(),
            '/signin': (_) => const LoginPage(),
            '/signup': (_) => const AccountCreatePage(),
          },

          // Tema do aplicativo
          debugShowCheckedModeBanner: false,
          // TEMA CLARO
          theme: lightTheme,
          // TEMA ESCURO
          darkTheme: darkTheme,
          // MODIFICAÇÃO DO TEMA USANDO O PROVIDER
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          // Tela que sempre vai iniciar quando aberto
          home: const SplashScreenPage(),
        );
      },
    );
  }
}

// TELA PARA DEFINIR SE O USUÁRIO ESTÁ LOGADO OU NÃO
class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
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
