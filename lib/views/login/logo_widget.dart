import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // BACKGROUND DA LOGO
      width: 100,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey
              : appLogo,
          borderRadius: BorderRadius.circular(10)),

      // IMAGEM DA LOGO
      child: Center(
        child: Image.asset(
          'assets/OfficiallogoApp.png',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}