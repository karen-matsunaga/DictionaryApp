import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ALTURA E COMPRIMENTO DA BORDA E IMAGEM
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    // FUNDO DA LOGO
    return Container(
      width: width / 3,
      height: height / 5,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey
              : appLogo,
          borderRadius: BorderRadius.circular(10)),

      // IMAGEM DA LOGO
      child: Center(
        child: Image.asset(
          'assets/logo.png',
          width: width / 3,
          height: height / 5,
        ),
      ),
    );
  }
}
