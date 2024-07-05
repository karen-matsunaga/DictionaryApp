import 'package:dictionary/style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Configurações do TEMA CLARO
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    // FUNDO do aplicativo
    scaffoldBackgroundColor: mainThemeApp,
    // Menu de CONFIGURAÇÕES do aplicativo
    drawerTheme: const DrawerThemeData(backgroundColor: drawer),
    // Definição da palavra no LIST TILE
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black,
      textColor: Colors.black,
    ),
    // Configurações da APPBAR
    appBarTheme: const AppBarTheme(
        backgroundColor: backgroundAppBarLight,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          decorationColor: backgroundAppBarSearch,
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true),
    // Configurações gerais do tema claro
    colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        background: Colors.white,
        onBackground: Colors.black,
        // APPBAR
        primary: Colors.black,
        onPrimary: Colors.white,
        // CARD
        surface: Colors.white,
        onSurface: Colors.black,
        // CHIP
        secondary: Colors.white,
        onSecondary: Colors.black,
        // ERRO
        onError: Colors.red,
        error: Colors.red,
        // CONTAINER
        primaryContainer: Colors.white,
        onPrimaryContainer: Colors.white,
        secondaryContainer: Colors.white54,
        onSecondaryContainer: Colors.black),
  );

  // Configurações do TEMA ESCURO
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    // FUNDO do aplicativo
    scaffoldBackgroundColor: Colors.grey[75],
    // Menu de CONFIGURAÇÕES do aplicativo
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.grey),
    // Definição da palavra no LIST TILE
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
      textColor: Colors.white,
    ),
    // Configurações da APPBAR
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[60],
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          decorationColor: backgroundAppBarSearch,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true),
    // Configurações gerais do tema ESCURO
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      background: Colors.black,
      onBackground: Colors.white,
      // APPBAR
      primary: Colors.white,
      onPrimary: Colors.white,
      // CARD
      surface: Colors.black,
      onSurface: Colors.white,
      // CHIP
      secondary: Colors.black,
      onSecondary: Colors.white,
      // ERRO
      onError: Colors.red,
      error: Colors.red,
      // CONTAINER
      primaryContainer: Colors.black,
      onPrimaryContainer: Colors.white,
      secondaryContainer: Colors.black45,
      onSecondaryContainer: Colors.white,
    ),
  );
}
