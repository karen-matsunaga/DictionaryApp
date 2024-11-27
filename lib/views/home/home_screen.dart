import 'dart:convert';
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/controllers/words_provider.dart';
import 'package:dictionary/models/words.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:substring_highlight/substring_highlight.dart';

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
    provider.Provider.of<WordsProvider>(context, listen: false).loadWords();
  }

/*   late TextEditingController searchController; */

  // FUNÇÃO DA BARRA DE PESQUISA DAS PALAVRAS DO APLICATIVO
  // CONTROLADOR DEVERÁ ARMAZENAR A PALAVRA QUE O USUÁRIO DIGITOU

  final _searchController = TextEditingController();

  // RETORNAR OS FILTROS DAS PALAVRAS COM BASE NO CONTROLADOR
  List<Words> filteredWords = [];

  // MÉTODO PARA FILTRAR AS PALAVRAS
  void _runFilter(String searchKeyword) {
    final allWords =
        provider.Provider.of<WordsProvider>(context, listen: false).words;
    List<Words> results = [];

    // SE O RESULTADO NÃO EXSITE
    if (searchKeyword.isEmpty) {
      results = allWords;
    } else {
      // SE EXISTIR OS RESULTADOS
      results = allWords
          .where((element) =>
              element.name.toLowerCase().contains(searchKeyword.toLowerCase()))
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
    final wordsProvider = provider.Provider.of<WordsProvider>(context);

    final allWords =
        provider.Provider.of<WordsProvider>(context, listen: false).words;

    // Design da HOMEPAGE
    return Scaffold(
      // APPBAR personalizada do aplicativo
      appBar: PreferredSize(
        preferredSize: sized,
        child: CustomAppbarWidget(
          title: "códex do programador",
        ),
      ),

      // DRAWER com as opções do MENU DE CONFIGURAÇÕES
      drawer: const MenuPage(),

      // Design da BARRA DE PESQUISA para pesquisar as palavras
      body: Column(
        children: [
          // BARRA DE PESQUISA - ATUAL
/*           Autocomplete(
            optionsBuilder: (TextEditingValue keyword) {
              if (keyword.text.isEmpty) {
                // SE NÃO ENCONTRAR AS PALAVRAS EXIBIRA UMA LISTA VAZIA
                return const Iterable<String>.empty();
              } else {
                // SE ENCONTRAR AS PALAVRAS EXIBIRA UMA LISTA COM PALAVRAS PRÓXIMAS DO PESQUISADO
                return allWords.where((word) => word.name
                    .toLowerCase()
                    .contains(keyword.text.toLowerCase()));
              }
            },
            optionsViewBuilder:
                (context, Function(String) onSelected, options) {
              return Material(
                elevation: 4,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options.elementAt(index);
                    // SUBTÍTULO DA PALAVRA
                    return ListTile(
                      title: SubstringHighlight(
                        text: option.toString(),
                        term: searchController.text,
                        textStyleHighlight: const TextStyle(
                            color: Colors.amber, fontWeight: FontWeight.w700),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          '/search',
                          arguments: jsonEncode(option),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                ),
              );
            },
            onSelected: (selectedString) {},
            fieldViewBuilder:
                (context, searchController, focusNode, onEditingComplete) {
              this.searchController = searchController;

              // BARRA DE PESQUISA
              return TextField(
                controller: searchController,
                focusNode: focusNode,
                onEditingComplete: onEditingComplete,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                ),
              );
            },
          ), */

          // BARRA DE PESQUISA - ANTIGA
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
                    // ICONES DE PESQUISA e FECHAR da barra de pesquisa
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

          // EXIBIÇÃO DE TODAS AS PALAVRAS DO words.json
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredWords.isNotEmpty
                  ? filteredWords.length
                  : wordsProvider.words.length,
              itemBuilder: (context, index) {
                final word = filteredWords.isNotEmpty
                    ? filteredWords[index]
                    : wordsProvider.words[index];

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
                                provider.Provider.of<FontSizeConfig>(context)
                                    .fontSize,
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
                                provider.Provider.of<FontSizeConfig>(context)
                                    .fontSize,
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
}
