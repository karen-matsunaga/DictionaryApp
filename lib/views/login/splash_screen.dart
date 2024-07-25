import 'package:dictionary/main.dart';
import 'package:dictionary/widgets/custom_logo_widget.dart';
import 'package:provider/provider.dart' as provider;
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  // TELA DE CARREGAMENTO DO APLICATIVO
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InitialScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TELA DE INICIALIZAÇÃO DO APLICATIVO
    return Scaffold(
      backgroundColor: lightBackgroundApp,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // LOGO DO APLICATIVO
              // Image.asset(
              //   'assets/images/logo.png',
              //   width: 200,
              //   height: 200,
              // ),
              LogoApp(),

              // ESPAÇAMENTO ENTRE LINHA
              spaceColumn,

              // NOME DO APLICATIVO
              Text(
                "Códex do Programador".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:
                        provider.Provider.of<FontSizeConfig>(context).fontSize),
              ),

              // ESPAÇAMENTO ENTRE LINHA
              spaceColumn,

              // CARREGAMENTO DO APLICATIVO
              CircularProgressIndicator(
                color: Theme.of(context).iconTheme.color,
              )
            ],
          ),
        ),
      ),
    );
  }
}
