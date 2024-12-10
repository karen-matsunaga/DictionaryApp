import 'package:flutter/material.dart';
import 'package:dictionary/controllers/controllers.dart';
import 'package:dictionary/models/models.dart';
import 'package:dictionary/views/views.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DynamicDarkMode(); // TEMA DO APLICATIVO
  await FontSizeConfig.loadFontSize(); // TAMANHO DA FONTE
  UserProvider(); // USUÁRIO LOGADO
  WordsProvider(); // ARQUIVO WORDS.JSON
  final dbHelper = DatabaseHelper(); // SQFLITE - BANCO DE DADOS
  FavoriteProvider(); // PALAVRAS FAVORITAS
  runApp(
    // Aqui rodamos o app dentro do Provider onde serão carregadas as configurações salvas pelo Shared Preferences, Provider e SQFLite
    MultiProvider(providers: [
      // TAMANHO DA FONTE
      ChangeNotifierProvider(create: (context) => FontSizeConfig()),
      // TEMA LIGHT/DARK
      ChangeNotifierProvider(create: (context) => DynamicDarkMode()),
      // USUÁRIO LOGADO
      ChangeNotifierProvider(
          create: (context) => UserProvider()..loadUserData()),
      // CARREGAMENTO DAS PALAVRAS DA CLASSE WORDS BASEADO NO WORDS.JSON
      ChangeNotifierProvider(create: (context) => WordsProvider()),
      // BANCO DE DADOS SQFLITE ATIVADO
      Provider<DatabaseHelper>.value(value: dbHelper),
      // TODAS AS PALAVRAS NO FAVORITO
      ChangeNotifierProvider(create: (context) => FavoriteProvider()),
    ], child: const CodexProgramador()), // ABERTURA DO APLICATIVO
  );
}

// ROTAS DE CADA PÁGINA DO APLICATIVO
class CodexProgramador extends StatelessWidget {
  const CodexProgramador({super.key, Users? loggedInUser});
  @override
  Widget build(BuildContext context) {
    return Consumer<DynamicDarkMode>(
      builder: (context, DynamicDarkMode themeProvider, child) {
        return MaterialApp(
          // ROTAS DAS TELAS
          routes: {
            '/homepage': (_) => const HomePage(),
            '/search': (_) => const SearchPage(),
            '/menu': (_) => const MenuPage(),
            '/config': (_) => const MenuConfigurationPage(),
            '/fav': (_) => FavoritePage(),
            '/signin': (_) => const LoginPage(),
            '/signup': (_) => const AccountCreatePage(),
          },
          debugShowCheckedModeBanner: false, // Tema do aplicativo
          theme: lightTheme, // TEMA CLARO
          darkTheme: darkTheme, // TEMA ESCURO
          themeMode: themeProvider.isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light, // MODIFICAÇÃO DO TEMA USANDO O PROVIDER
          home:
              const SplashScreenPage(), // Tela que sempre vai iniciar quando aberto
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
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        if (userProvider.email == null) {
          return const LoginPage(); // SE TIVER LOGADO
        } else {
          return const HomePage(); // SE NÃO TIVER LOGADO
        }
      },
    );
  }
}
