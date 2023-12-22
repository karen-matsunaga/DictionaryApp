// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:dictionary/pages/configuration_edit_page.dart';
import 'package:dictionary/provider/fontsize-provider.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/menu/menu_page.dart';
import 'package:provider/provider.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar do aplicativo
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey
            : Theme.of(context).appBarTheme.backgroundColor,
        title: Text("Configurações",
            style: TextStyle(
                fontSize: Provider.of<FontSizeConfig>(context).fontSize)),
        centerTitle: true,
        elevation: 0,
      ),

      // Opções do Menu de configurações
      drawer: HomePage(),

      // Configurações do TAMANHO DA FONTE e TEMA CLARO / ESCURO
      body: ConfigurationPage(),
    );
  }
}
