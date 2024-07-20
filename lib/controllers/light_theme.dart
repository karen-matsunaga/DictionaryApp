import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  // BRIGHTNESS
  brightness: Brightness.light,

  // ICONES
  iconTheme: IconThemeData(color: lightIcon),

  // LIST TILE
  listTileTheme: ListTileThemeData(
    iconColor: lightIcon,
  ),

  // APPBAR
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundAppBarLight,
  ),

  // DRAWER
  drawerTheme: DrawerThemeData(
    backgroundColor: lightDrawer,
  ),

  // SCAFFOLD
  scaffoldBackgroundColor: lightScaffoldApp,

  // INPUT DECORATION
  inputDecorationTheme: InputDecorationTheme(fillColor: backgroundAppBarSearch),

  // SELEÇÃO DO TEXTO
  textSelectionTheme: TextSelectionThemeData(cursorColor: lightText),

  // TOGGLE BUTTONS
  toggleButtonsTheme: ToggleButtonsThemeData(
    borderColor: lightBorder,
    color: lightText,
    selectedBorderColor: lightBorderSelected,
    selectedColor: lightColorSelected,
    fillColor: lightFillColor,
  ),

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

    surface: lightIconBorder,
    onSurface: lightText,

    // ERROS
    error: lightBackgroundApp,
    onError: blackErrorColor,
  ),
);
