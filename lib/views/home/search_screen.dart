import 'dart:convert';
import 'package:dictionary/controllers/favorite_provider.dart';
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/models/words.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:dictionary/widgets/custom_box_widget.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // CONTROLADORES
  final searchController = TextEditingController();

  // EXIBIÇÃO DO ID ESPECÍFICO
  var wordName = "";
  Words? word;

  // INICIAR TODA VEZ QUE ACESSAR O APLICATIVO
  @override
  void initState() {
    super.initState();
  }

  // CARREGAR OS DADOS DA PALAVRA ESPECÍFICA
  @override
  void didChangeDependencies() {
    var wordString = ModalRoute.of(context)?.settings.arguments as String;
    var wordJson = jsonDecode(wordString);

    setState(() {
      word = Words.fromJson(wordJson);
      wordName = word!.name;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // FUNÇÃO DO BOTÃO DE FAVORITOS
    final favoriteProvider = FavoriteProvider.of(context);
    // RESPONSIVIDADE DAS TELAS
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // SEARCHBAR APPLICATION
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // AppBar do aplicativo
      appBar: const CustomAppBar(title: "Códex do Programador"),

      // Opções do Menu de configurações
      drawer: const MenuPage(),

      // Texto com a definição da palavra pesquisada com o arquivo words.JSON
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: height * 4.06,
          width: width * 1,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              // Comando pesquisado e sua função
              ListTile(
                // PALAVRA PESQUISADA
                title: Text(
                  word!.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize),
                ),
                // DESCRIÇÃO DA PALAVRA
                subtitle: Text(
                  word!.description,
                  style: TextStyle(
                      fontSize: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize),
                ),

                // Icone para adicionar a palavra em FAVORITO
                // DESIGN DO FUNDO DO BOTÃO
                trailing: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),

                  // BOTÃO PARA ADICIONAR OU REMOVER DO FAVORITO
                  child: IconButton(
                    onPressed: () {
                      favoriteProvider.toggleFavorite(word!.name);
                    },
                    icon: favoriteProvider.isExist(word!.name)
                        // PALAVRA ADICIONADA NOS FAVORITOS
                        ? Icon(
                            Icons.favorite,
                            color: favoriteIcon,
                            size: provider.Provider.of<FontSizeConfig>(context)
                                .fontSize,
                          )
                        // PALAVRA NÃO ADICIONADA NOS FAVORITOS
                        : Icon(
                            Icons.favorite_border,
                            color: favoriteIcon,
                            size: provider.Provider.of<FontSizeConfig>(context)
                                .fontSize,
                          ),
                  ),
                ),
              ),

              // Refatoração da primeira box PYTHON
              CustomBox(language: 'Python', text: word!.python),

              // Refatoração da segunda box C#
              CustomBox(language: 'C#', text: word!.cSharp),

              // Refatoração da terceira box JAVA

              CustomBox(language: 'Java', text: word!.java),

              // Refatoração da quarta box SAÍDA DE DADOS
              CustomBox(language: 'Saída de Dados', text: word!.exit),
            ],
          ),
        ),
      ),
    );
  }
}
