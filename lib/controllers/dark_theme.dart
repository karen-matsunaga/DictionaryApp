import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    // SCAFFOLD
    primary: blackBackgroundApp,
    onPrimary: darkText,

    // CONTAINER
    primaryContainer: blackCardColor,
    onPrimaryContainer: darkText,

    // BOTOES
    secondary: buttonLight,
    onSecondary: darkText,

    // ERROS
    error: blackBackgroundApp,
    onError: blackErrorColor,
  ),
  iconTheme: IconThemeData(color: darkIcon),
  appBarTheme: AppBarTheme(
    backgroundColor: blackCardColor,
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: blackCardColor,
  ),
);
