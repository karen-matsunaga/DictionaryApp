import 'dart:convert';
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/controllers/words_provider.dart';
import 'package:dictionary/models/words.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // CONTROLADORES
  final _searchController = TextEditingController();

  // LISTA E FILTRO DAS PALAVRAS
  List<Words> filteredWords = [];

  // TODA VEZ QUE INICIAR O APLICATIVO O ARQUIVO words.json SERÁ ATIVADO
  @override
  void initState() {
    super.initState();
    provider.Provider.of<WordsProvider>(context, listen: false).loadWords();
  }

  // BARRA DE PESQUISA DAS PALAVRAS
  void _runFilter(String searchKeyword) {
    final allWords =
        provider.Provider.of<WordsProvider>(context, listen: false).words;
    List<Words> results = [];

    if (searchKeyword.isEmpty) {
      results = allWords;
    } else {
      results = allWords
          .where((element) =>
              element.name.toLowerCase().contains(searchKeyword.toLowerCase()))
          .toList();
    }

    // refresh the UI
    setState(() {
      filteredWords = results;
    });
  }

  // @override
  @override
  Widget build(BuildContext context) {
    final allWords = provider.Provider.of<WordsProvider>(context).words;
    return Scaffold(
      // AppBar do aplicativo
      appBar: const CustomAppBar(
        title: "Códex do Programador",
      ),

      // Opções do Menu de configurações
      drawer: const MenuPage(),

      // BARRA DE PESQUISA para pesquisar as palavras
      body: Column(
        children: [
          Center(
            child: PreferredSize(
              preferredSize: const Size(50.0, 50.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                // BARRA DE PESQUISA DESIGN
                child: TextField(
                  cursorColor: Theme.of(context).colorScheme.onPrimary,
                  controller: _searchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                    hintStyle: TextStyle(
                        fontSize: provider.Provider.of<FontSizeConfig>(context)
                            .fontSize),
                    // Icone de pesquisa e fechar da barra de pesquisa
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      size: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.zero,
                    filled: true,
                  ),

                  // FILTRO DAS PALAVRAS
                  onSubmitted: (value) => _runFilter(value),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredWords.isNotEmpty
                  ? filteredWords.length
                  : allWords.length,
              itemBuilder: (BuildContext context, index) {
                final word = filteredWords.isNotEmpty
                    ? filteredWords[index]
                    : allWords[index];
                return Card(
                    margin: EdgeInsets.all(15.0),
                    color: Colors.greenAccent,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          word.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          word.type,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          '/search',
                          arguments: jsonEncode(word),
                        );
                      },
                    ));
              },
            ),
          ),
          // ESPAÇAMENTO ENTRE OS COMPONENTES
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
