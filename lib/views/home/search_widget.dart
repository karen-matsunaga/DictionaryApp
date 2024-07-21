import 'dart:convert';

import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/models/codes.dart';
import 'package:dictionary/views/home/custom_box_widget.dart';
import 'package:dictionary/views/home/custom_fav_widget.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/views/profile/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart' as provider;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // CONTROLADORES
  final searchController = TextEditingController();

  // FILTRO DA PESQUISA
  List<dynamic> wordList = [];

  // LENDO O ARQUIVO CODES.JSON
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/codes.json');
    final data = await json.decode(response);

    setState(() {
      wordList = data['codes'].map((data) => Codes.fromJson(data)).toList();
    });
  }

  // TODA VEZ QUE INICIAR O APLICATIVO O ARQUIVO CODES.JSON SERÁ ATIVADO
  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    // SEARCHBAR APPLICATION
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // AppBar do aplicativo
      appBar: const CustomAppBar(title: "Códex do Programador"),

      // Opções do Menu de configurações
      drawer: const MenuPage(),

      // Texto com a definição da palavra pesquisada com o SQLite
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: wordList.length,
          itemBuilder: (BuildContext context, snapshot) {
            // OS DADOS VAZIOS
            if (wordList[snapshot] == null) {
              return const CircularProgressIndicator();
            }
            // OS DADOS EXISTENTES
            else {
              return Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    // Comando pesquisado e sua função
                    ListTile(
                      title: Text(
                        // 'Print'.toUpperCase(),
                        wordList[snapshot]['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                provider.Provider.of<FontSizeConfig>(context)
                                    .fontSize),
                      ),
                      subtitle: Text(
                        // 'Função principal mostrar na tela.',
                        wordList[snapshot]['description'],
                        style: TextStyle(
                            fontSize:
                                provider.Provider.of<FontSizeConfig>(context)
                                    .fontSize),
                      ),
                      // Icone para adicionar a palavra em FAVORITO (NÃO IMPLEMENTADA)
                      trailing: const FavoriteIcon(),
                    ),

                    // Refatoração da primeira box PYTHON
                    const CustomBox(
                        language: 'Python', text: 'print("Olá, mundo!")'),

                    // Refatoração da segunda box C#
                    const CustomBox(
                        language: 'C#',
                        text:
                            'Console.Write("Olá, mundo!");\nConsole.WriteLine("Olá, mundo!");'),

                    // Refatoração da terceira box JAVA

                    const CustomBox(
                        language: 'Java',
                        text:
                            'public class Main { \npublic static void main(String[] args) { \nSystem.out.println("Olá, mundo!"); \n} \n}'),

                    // Refatoração da quarta box SAÍDA DE DADOS
                    const CustomBox(
                      language: 'Saída de Dados',
                      text: 'Olá, mundo!',
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
