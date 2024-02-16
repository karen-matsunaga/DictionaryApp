// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, file_names;, file_names, sort_child_properties_last, use_build_context_synchronously
import 'package:dictionary/provider/fontsize-provider.dart';
import 'package:dictionary/menu/menu_page.dart';
import 'package:dictionary/homepage/search_page.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/style.dart';
import 'package:provider/provider.dart' as provider;

class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({super.key});

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  final _searchController = TextEditingController();

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
                letterSpacing: 1,
                fontSize:
                    provider.Provider.of<FontSizeConfig>(context).fontSize)),
        centerTitle: true,
        // Fundo do aplicativo da AppBar
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? appLogo
            : Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
      ),

      // Opções do Menu de configurações
      drawer: HomePage(),

      // BARRA DE PESQUISA para pesquisar as palavras
      body: Center(
        child: PreferredSize(
          preferredSize: Size(50.0, 50.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontSize:
                        provider.Provider.of<FontSizeConfig>(context).fontSize),
                // Icone de pesquisa e fechar da barra de pesquisa
                prefixIcon: Icon(
                  Icons.search_rounded,
                  size: provider.Provider.of<FontSizeConfig>(context).fontSize,
                ),
                hintText: 'Search',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero,
                filled: true,
              ),
              onSubmitted: (value) async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DictionarySearchPage(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
