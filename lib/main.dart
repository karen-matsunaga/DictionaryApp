// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, avoid_print

// import 'package:dictionary/configuration/dictionary-config.dart';
// import 'package:dictionary/perfil/dictionary-updateaccount.dart';

import 'package:dictionary/login/signup_page.dart';
// import 'package:dictionary/utils/constants.dart';
import 'package:dictionary/provider/fontsize-provider.dart';
import 'package:dictionary/menu/menu_page.dart';
import 'package:dictionary/login/signup_account_page.dart';
import 'package:dictionary/login/password_edit_page.dart';
import 'package:dictionary/login/password_recovery_page.dart';
import 'package:dictionary/menu/favorite_page.dart';
import 'package:dictionary/menu/config_page.dart';
import 'package:dictionary/controllers/app-theme.dart';
import 'package:dictionary/provider/darktheme-provider.dart';
import 'package:dictionary/search/homepage_page.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/search/search_page.dart';
import 'package:dictionary/login/login_page.dart';
import 'package:provider/provider.dart' as provider;

// import 'package:dictionary/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DynamicDarkMode();
  await FontSizeConfig.loadFontSize();
  runApp(
    provider.MultiProvider(providers: [
      provider.ChangeNotifierProvider(create: (context) => FontSizeConfig()),
      // Aqui rodamos o app dentro do provider
      provider.ChangeNotifierProvider(create: (context) => DynamicDarkMode()),
    ], child: CodexProgramador()),
  );
  // await Supabase.initialize(
  //   url: 'https://yqkqzuxiztfcgedrdmfg.supabase.co',
  //   anonKey:
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlxa3F6dXhpenRmY2dlZHJkbWZnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTg0MzQzNDQsImV4cCI6MjAxNDAxMDM0NH0.-S6YS6j_LKiNQ7qgzU1TF6D2x6nmEyetqKElj12JuqY',
  // );
}

// class SupabaseHandler {
//   static String supabaseUrl = "";
//   static String supabaseKey = "";

//   final client = SupabaseClient(supabaseUrl, supabaseKey);

//   readData() async {
//     var response = await client.from('codigo').select();
//     print(response);
//     final dataList = response.data as List;
//     return dataList;
//   }
// }

class CodexProgramador extends StatelessWidget {
  const CodexProgramador({super.key});
  @override
  Widget build(BuildContext context) {
    return provider.Consumer<DynamicDarkMode>(
      builder: (context, DynamicDarkMode themeProvider, child) {
        return MaterialApp(
          routes: {
            // '/profile': (context) => AccountUpdatePage(),
            '/homepage': (context) => HomeSearchPage(),
            '/search': (context) => DictionarySearchPage(),
            '/favorite': (context) => SecondPage(),
            '/menu': (context) => HomePage(),
            '/config': (context) => ThirdPage(),
            '/signin': (context) => LoginPage(),
            '/signup': (context) => AccountCreatePage(),
            '/message': (context) => AccountConfirmation(),
            '/password': (context) => PasswordPage(),
            '/passwordrecovery': (context) => PasswordConfirmation(),
            // '/': (context) => LoginMainPage(),
          },
          // Rota que deve iniciar toda vez que executar
          // initialRoute:
          //     client.auth.currentSession != null ? '/homepage' : '/signin',
          // Tema do aplicativo
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          // Local em que está a alteração do tema
          // home: const LoginMainPage(),
        );
      },
    );
    // });
  }
}

// CLASSE PARA FAZER A AUTENTICAÇÃO DA CONTA
// class LoginMainPage extends StatefulWidget {
//   const LoginMainPage({super.key});

//   @override
//   State<LoginMainPage> createState() => _LoginMainPageState();
// }

// class _LoginMainPageState extends State<LoginMainPage> {
//   // User? _user;

//   @override
//   void initState() {
//     _getAuth();
//     super.initState();
//   }

//   Future<void> _getAuth() async {
//     setState(() {
//       _user = client.auth.currentUser;
//     });
//     client.auth.onAuthStateChange.listen((event) {
//       setState(() {
//         _user = event.session?.user;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: _user == null ? const LoginPage() : const HomeSearchPage());
//   }
// }
