import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/views/profile/favorite_widget.dart';
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
      drawer: const HomePage(),

      // Lista de todas as palavras salvas
      body: const Favorite(),
    );
  }
}
