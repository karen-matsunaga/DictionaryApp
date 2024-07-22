import 'dart:convert';
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/models/words.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  List<Words> allWords = [];
  List<Words> filteredWords = [];

  // LENDO O ARQUIVO WORDS.JSON
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/words.json');
    final wordData = await json.decode(response);

    var list = wordData["words"] as List<dynamic>;

    setState(() {
      allWords = [];
      allWords = list.map((e) => Words.fromJson(e)).toList();
      filteredWords = allWords;
    });
  }

  // BARRA DE PESQUISA DAS PALAVRAS
  void _runFilter(String searchKeyword) {
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

  // TODA VEZ QUE INICIAR O APLICATIVO O ARQUIVO words.json SERÁ ATIVADO
  @override
  void initState() {
    super.initState();
    readJson();
  }

  // @override
  @override
  Widget build(BuildContext context) {
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

                  // === PESQUISA DA PALAVRA - CONTROLADOR E BANCO DE DADOS ===
                  onSubmitted: (value) => _runFilter(value),
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const SearchPage(),
                  //   ),
                  // );
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredWords.length,
              itemBuilder: (BuildContext context, index) {
                return Card(
                    margin: EdgeInsets.all(15.0),
                    color: Colors.greenAccent,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(filteredWords[index].name),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          filteredWords[index].type,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          '/search',
                          arguments: jsonEncode(filteredWords[index]),
                        );
                      },
                    ));
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
