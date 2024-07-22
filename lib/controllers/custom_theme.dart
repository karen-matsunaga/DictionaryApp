import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';

// ARMAZENAMENTO DOS TEMAS LIGHT E DARK

// TEMA LIGHT CUSTOMIZADO
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

// TEMA DARK CUSTOMIZADO
ThemeData darkTheme = ThemeData(
  // BRIGHTNESS
  brightness: Brightness.dark,

  // ICON
  iconTheme: IconThemeData(color: darkIcon),

  // APPBAR
  appBarTheme: AppBarTheme(
    backgroundColor: blackCardColor,
  ),

  // DRAWER
  drawerTheme: DrawerThemeData(
    backgroundColor: blackDrawer,
  ),

  // TOGGLE BUTTONS
  toggleButtonsTheme: ToggleButtonsThemeData(
    borderColor: darkBorder,
    color: darkText,
    selectedBorderColor: darkBorderSelected,
    selectedColor: darkColorSelected,
    fillColor: darkFillColor,
  ),

  // LIST TILE
  listTileTheme: ListTileThemeData(
    iconColor: darkIcon,
  ),

  // SCAFFOLD
  scaffoldBackgroundColor: blackScaffoldApp,

  // INPUT DECORATION
  inputDecorationTheme: InputDecorationTheme(fillColor: darkSearch),

  // SELEÇÃO DE TEXTO

  // COLOR SCHEME
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

    surface: blackIconBorder,
    onSurface: darkText,

    // ERROS
    error: blackBackgroundApp,
    onError: blackErrorColor,
  ),
);
