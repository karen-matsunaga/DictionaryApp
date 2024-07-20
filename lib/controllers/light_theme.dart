import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  // BRIGHTNESS
  brightness: Brightness.light,

  // ICONES
  iconTheme: IconThemeData(color: lightIcon),

  // APPBAR
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundAppBarLight,
  ),

  // DRAWER
  drawerTheme: DrawerThemeData(
    backgroundColor: drawer,
  ),

  // SCAFFOLD
  scaffoldBackgroundColor: lightScaffoldApp,

  // INPUT DECORATION
  inputDecorationTheme: InputDecorationTheme(fillColor: backgroundAppBarSearch),

  textSelectionTheme: TextSelectionThemeData(cursorColor: lightText),

  // COLOR SCHEME
  colorScheme: ColorScheme.light(
    // SCAFFOLD
    primary: lightScaffoldApp,
    onPrimary: lightText,

    // CONTAINER
    primaryContainer: whiteCardColor,
    onPrimaryContainer: lightText,

    // BOTOES
    secondary: buttonLight,
    onSecondary: lightText,

    // FUNDO DA BORDA
    tertiary: appLogo,
    onTertiary: lightText,

    // ERROS
    error: lightBackgroundApp,
    onError: blackErrorColor,
  ),
);
