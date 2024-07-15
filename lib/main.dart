import 'package:dictionary/views/home/initial_widget.dart';

import 'all.dart';
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
          provider.ChangeNotifierProvider(create: (context) => UserProvider()),
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
