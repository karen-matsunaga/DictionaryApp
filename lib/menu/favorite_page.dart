// ignore_for_file: prefer_const_constructors,
// prefer_const_literals_to_create_immutables, file_names

import 'package:dictionary/provider/fontsize-provider.dart';
import 'package:dictionary/style.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/menu/menu_page.dart';
import 'package:dictionary/profile/favorite_page.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar do aplicativo
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? appLogo
            : Theme.of(context).appBarTheme.backgroundColor,
        title: Text("Favoritos".toUpperCase(),
            style: TextStyle(
                fontSize: Provider.of<FontSizeConfig>(context).fontSize)),
        centerTitle: true,
        elevation: 0,
      ),

      // Opções do Menu de configurações
      drawer: HomePage(),

      // Lista de todas as palavras salvas
      body: Favorite(),
    );
  }
}
