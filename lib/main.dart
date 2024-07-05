<<<<<<< HEAD
import 'package:dictionary/authentication/signup_page.dart';
// import 'package:dictionary/profile/configuration_edit_page.dart';
import 'package:dictionary/provider/fontsize_provider.dart';
import 'package:dictionary/menu/menu_page.dart';
// import 'package:dictionary/authentication/forget_password_page.dart';
import 'package:dictionary/menu/favorite_page.dart';
import 'package:dictionary/menu/configuration_page.dart';
import 'package:dictionary/controllers/app_theme.dart';
import 'package:dictionary/provider/darktheme_provider.dart';
=======
// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:dictionary/authentication/signup_page.dart';
import 'package:dictionary/provider/fontsize-provider.dart';
import 'package:dictionary/menu/menu_page.dart';
import 'package:dictionary/menu/favorite_page.dart';
import 'package:dictionary/menu/configuration_page.dart';
import 'package:dictionary/controllers/app-theme.dart';
import 'package:dictionary/provider/darktheme-provider.dart';
>>>>>>> 400a6f1a4c61598388e296e26b18d40d51543b58
import 'package:dictionary/homepage/homepage_page.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/homepage/search_page.dart';
import 'package:dictionary/authentication/login_page.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart' as provider;
=======
import 'package:provider/provider.dart';
>>>>>>> 400a6f1a4c61598388e296e26b18d40d51543b58

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DynamicDarkMode();
  await FontSizeConfig.loadFontSize();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => FontSizeConfig()),
      // Aqui rodamos o app dentro do provider
<<<<<<< HEAD
      provider.ChangeNotifierProvider(create: (context) => DynamicDarkMode()),
    ], child: const CodexProgramador()),
=======
      ChangeNotifierProvider(create: (context) => DynamicDarkMode()),
    ], child: CodexProgramador()),
>>>>>>> 400a6f1a4c61598388e296e26b18d40d51543b58
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
<<<<<<< HEAD
            '/homepage': (context) => const HomeSearchPage(),
            '/search': (context) => const DictionarySearchPage(),
            '/favorite': (context) => const FavoritePage(),
            '/menu': (context) => const HomePage(),
            '/config': (context) => const MenuConfigurationPage(),
            '/signin': (context) => const LoginPage(),
            '/signup': (context) => const AccountCreatePage(),
            // '/passwordrecovery': (context) => PasswordConfirmation(),
=======
            '/homepage': (context) => HomeSearchPage(),
            '/search': (context) => DictionarySearchPage(),
            '/favorite': (context) => FavoritePage(),
            '/menu': (context) => HomePage(),
            '/config': (context) => MenuConfigurationPage(),
            '/signin': (context) => LoginPage(),
            '/signup': (context) => AccountCreatePage(),
>>>>>>> 400a6f1a4c61598388e296e26b18d40d51543b58
          },

          // Tema do aplicativo
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,

<<<<<<< HEAD
          home: const LoginPage(),
=======
          home: LoginPage(),
>>>>>>> 400a6f1a4c61598388e296e26b18d40d51543b58
        );
      },
    );
  }
}
