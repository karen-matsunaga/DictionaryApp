import 'package:dictionary/controllers/controllers.dart';
import 'package:dictionary/models/models.dart';
import 'package:dictionary/views/views.dart';
import 'package:dictionary/widgets/widgets.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // INICIOU O APLICATIVO O MÉTODO WordsProvider E ARQUIVO words.json SÃO CARREGADOS
  @override
  void initState() {
    super.initState();
    Provider.of<WordsProvider>(context, listen: false).loadWords();
  }

  // FUNÇÃO DA BARRA DE PESQUISA DAS PALAVRAS DO APLICATIVO
  // CONTROLADOR DEVERÁ ARMAZENAR A PALAVRA QUE O USUÁRIO DIGITOU

  final _searchController = TextEditingController();

  // RETORNAR OS FILTROS DAS PALAVRAS COM BASE NO CONTROLADOR
  List<Words> filteredWords = [];

  // MÉTODO PARA FILTRAR AS PALAVRAS
  void _runFilter(String searchKeyword) {
    final allWords = Provider.of<WordsProvider>(context, listen: false).words;
    List<Words> results = [];

    // SE O RESULTADO NÃO EXSITE
    if (searchKeyword.isEmpty) {
      results = allWords;
    } else {
      // SE EXISTIR OS RESULTADOS
      results = allWords
          .where((element) => ((
                (element.name).toLowerCase(),
                (element.synonyms).toLowerCase(),
                (element.type).toLowerCase()
              ).toString().contains(searchKeyword.toLowerCase())))
          .toList();
    }

    // ATUALIZAR A TELA APÓS A DIGITAÇÃO NA BARRA DE PESQUISA
    setState(() {
      filteredWords = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    // LISTA DE TODAS AS PALAVRAS DO ARQUIVO words.json
    final wordsProvider = Provider.of<WordsProvider>(context);

    // Design da HOMEPAGE
    return Scaffold(
      // APPBAR personalizada do aplicativo
      appBar: PreferredSize(
        preferredSize: sized,
        child: CustomAppbarWidget(
          title: "",
        ),
      ),

      // DRAWER com as opções do MENU DE CONFIGURAÇÕES
      drawer: const MenuPage(),

      // Design da BARRA DE PESQUISA para pesquisar as palavras
      body: Column(
        children: [
          // BARRA DE PESQUISA
          Center(
            child: PreferredSize(
              preferredSize: const Size(50.0, 50.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                // BARRA DE PESQUISA DESIGN
                child: TextField(
                  // ATUALIZAÇÃO EM TEMPO REAL DA PESQUISA
                  onChanged: _runFilter,
                  // DESIGN DA BARRA DE PESQUISA
                  cursorColor: Theme.of(context).colorScheme.onPrimary,
                  controller: _searchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                    hintStyle: TextStyle(
                        fontSize:
                            Provider.of<FontSizeConfig>(context).fontSize),
                    // ICONES DE PESQUISA e FECHAR da barra de pesquisa
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      size: Provider.of<FontSizeConfig>(context).fontSize,
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

          // EXIBIÇÃO DE TODAS AS PALAVRAS DO words.json
          Expanded(
            // LISTA DE TODAS AS PALAVRAS
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredWords.isNotEmpty
                  ? filteredWords.length
                  : wordsProvider.words.length,
              itemBuilder: (context, index) {
                final word = filteredWords.isNotEmpty
                    ? filteredWords[index]
                    : wordsProvider.words[index];
                // RETORNA A PALAVRA E O TIPO EM FORMATO DE CARTA
                return Card(
                  margin: EdgeInsets.all(15.0),
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: ListTile(
                    // NOME DA PALAVRA
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        word.name,
                        style: TextStyle(
                            fontSize:
                                Provider.of<FontSizeConfig>(context).fontSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // TIPO DA PALAVRA
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        word.type,
                        style: TextStyle(
                            fontSize:
                                Provider.of<FontSizeConfig>(context).fontSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // PALAVRA PRESSIONADA PARA EXIBIR INFORMAÇÕES ESPECÍFICAS
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/search',
                        arguments: jsonEncode(word),
                      );
                    },
                  ),
                );
              },
            ),
          ),

          // ESPAÇAMENTO ENTRE OS COMPONENTES DA LISTVIEW
          spaceListView,
        ],
      ),
    );
  }

  // LIMPAR A PESQUISA REALIZADA
  @override
  void dispose() {
    _searchController.clear();
    super.dispose();
  }
}
