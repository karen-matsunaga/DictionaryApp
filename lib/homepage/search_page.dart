// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, file_names;, file_names, sort_child_properties_last

import 'package:dictionary/provider/fontsize-provider.dart';
import 'package:dictionary/menu/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/style.dart';
import 'package:provider/provider.dart' as provider;

class DictionarySearchPage extends StatefulWidget {
  const DictionarySearchPage({super.key});

  @override
  State<DictionarySearchPage> createState() => _DictionarySearchPageState();
}

class _DictionarySearchPageState extends State<DictionarySearchPage> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar do aplicativo
      appBar: AppBar(
        // Icone do Menu de configurações
        iconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.dark
              ? backgroundIconsWhite
              : backgroundAppBarIcons,
        ),
        // Nome do aplicativo
        title: Text("Códex do Programador".toUpperCase(),
            style: TextStyle(
                fontSize:
                    provider.Provider.of<FontSizeConfig>(context).fontSize)),
        centerTitle: true,
        // Fundo do aplicativo da AppBar
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            // ? Colors.grey
            ? appLogo
            : Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
      ),

      // Opções do Menu de configurações
      drawer: HomePage(),

      // Texto com a definição da palavra pesquisada com o SQLite
      body: SingleChildScrollView(
        child: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    // Comando pesquisado e sua função
                    ListTile(
                      title: Text(
                        'Print'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                provider.Provider.of<FontSizeConfig>(context)
                                    .fontSize),
                      ),
                      subtitle: Text(
                        'Função principal mostrar na tela.',
                        style: TextStyle(
                            fontSize:
                                provider.Provider.of<FontSizeConfig>(context)
                                    .fontSize),
                      ),
                      // Implementação da palavra na tabela FAVORITOS
                      trailing: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Color.fromRGBO(217, 217, 217, 1.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Icon(Icons.favorite_rounded,
                              color: Colors.red,
                              size:
                                  provider.Provider.of<FontSizeConfig>(context)
                                      .fontSize),
                        ),
                      ),
                    ),

                    // Refatoração da primeira box PYTHON
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .9,
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.only(left: 16, top: 19, right: 16),
                      decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? appLogo
                              : columns,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(bottom: 40)),
                              Expanded(
                                child: Text(
                                  'Python'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          provider.Provider.of<FontSizeConfig>(
                                                  context)
                                              .fontSize),
                                  maxLines: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'print("Olá, mundo!")',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize:
                                          provider.Provider.of<FontSizeConfig>(
                                                  context)
                                              .fontSize),
                                  maxLines: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Refatoração da segunda box C#
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .9,
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.only(left: 16, top: 19, right: 16),
                      decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? appLogo
                              : columns,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(bottom: 40)),
                              Expanded(
                                child: Text(
                                  'C#'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          provider.Provider.of<FontSizeConfig>(
                                                  context)
                                              .fontSize),
                                  maxLines: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Console.Write("Olá, mundo!");\nConsole.WriteLine("Olá, mundo!");',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize:
                                          provider.Provider.of<FontSizeConfig>(
                                                  context)
                                              .fontSize),
                                  maxLines: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Refatoração da terceira box JAVA
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .9,
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.only(left: 16, top: 19, right: 16),
                      decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? appLogo
                              : columns,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(bottom: 40)),
                              Expanded(
                                child: Text(
                                  'Java'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          provider.Provider.of<FontSizeConfig>(
                                                  context)
                                              .fontSize),
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'public class Main { \npublic static void main(String[] args) { \nSystem.out.println("Olá, mundo!"); \n} \n}',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize:
                                          provider.Provider.of<FontSizeConfig>(
                                                  context)
                                              .fontSize),
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Refatoração da quarta box SAÍDA DE DADOS
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .9,
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.only(left: 16, top: 19, right: 16),
                      decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? appLogo
                              // ? Colors.grey
                              : columns,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(bottom: 40)),
                              Expanded(
                                child: Text(
                                  'Saída de Dados'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          provider.Provider.of<FontSizeConfig>(
                                                  context)
                                              .fontSize),
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Olá, mundo!',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize:
                                          provider.Provider.of<FontSizeConfig>(
                                                  context)
                                              .fontSize),
                                  maxLines: 20,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
