import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:provider/provider.dart' as provider;
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/views/profile/config_screen.dart';
import 'package:flutter/material.dart';

class MenuConfigurationPage extends StatelessWidget {
  const MenuConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR do aplicativo
      appBar: AppBar(
        // Icone do Menu de configurações
        iconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color,
        ),
        // Nome do aplicativo
        title: Text(
          "configurações".toUpperCase(),
          style: TextStyle(
            letterSpacing: 1,
            fontSize: provider.Provider.of<FontSizeConfig>(context).fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,

        // Fundo do aplicativo da AppBar
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
      ),

      // OPÇÕES do Menu de configurações
      drawer: MenuPage(),

      // CONFIGURAÇÕES do tamanho da FONTE e tema CLARO / ESCURO
      body: ConfigurationPage(),
    );
  }
}
