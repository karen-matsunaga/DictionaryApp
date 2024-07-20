import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';

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
