import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/views/profile/config_screen.dart';
import 'package:dictionary/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

class MenuConfigurationPage extends StatelessWidget {
  const MenuConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // APPBAR do aplicativo
      appBar: CustomAppBar(title: "Configurações"),

      // OPÇÕES do Menu de configurações
      drawer: MenuPage(),

      // CONFIGURAÇÕES do tamanho da FONTE e tema CLARO / ESCURO
      body: ConfigurationPage(),
    );
  }
}
