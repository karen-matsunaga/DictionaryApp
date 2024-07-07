import 'package:dictionary/views/profile/config_update_widget.dart';
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:provider/provider.dart' as provider;

class MenuConfigurationPage extends StatelessWidget {
  const MenuConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR do aplicativo
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? appLogo
            : Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          "Configurações".toUpperCase(),
          style: TextStyle(
            fontSize: provider.Provider.of<FontSizeConfig>(context).fontSize,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),

      // OPÇÕES do Menu de configurações
      drawer: const HomePage(),

      // CONFIGURAÇÕES do tamanho da FONTE e tema CLARO / ESCURO
      body: const ConfigurationPage(),
    );
  }
}
