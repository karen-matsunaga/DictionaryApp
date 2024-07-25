import 'dart:convert';
import 'package:dictionary/controllers/favorite_provider.dart';
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:provider/provider.dart' as provider;
import 'package:dictionary/models/words.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:dictionary/widgets/custom_box_widget.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:flutter/material.dart';

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

    // APPBAR
    var appBar = AppBar(
      // Icone do Menu de configurações
      iconTheme: IconThemeData(
        color: Theme.of(context).iconTheme.color,
      ),
      // Nome do aplicativo
      title: Text(
        "códex".toUpperCase(),
        style: TextStyle(
          letterSpacing: 1,
          fontSize: provider.Provider.of<FontSizeConfig>(context).fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,

      // Fundo do aplicativo da AppBar
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
    );

    var size = MediaQuery.of(context).size;
    var screenHeight = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;

    // SEARCHBAR APPLICATION
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // AppBar do aplicativo
      appBar: appBar,

      // Opções do Menu de configurações
      drawer: const MenuPage(),

      // Texto com a definição da palavra pesquisada com o arquivo words.JSON
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        // CONTAINER
        child: Container(
          alignment: Alignment.center,
          height: screenHeight,
          width: size.width,
          padding: const EdgeInsets.all(20),
          // COLUNA
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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

                // ICONE BOTÃO PARA ADICIONAR OU REMOVER A PALAVRA NA LISTA DE FAVORITO
                trailing: IconButton(
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
              Expanded(
                child: ListView(
                  children: <Widget>[
                    // Refatoração da primeira box PYTHON
                    CustomBox(
                      language: 'Python',
                      text: word!.python,
                      width: size.width,
                    ),

                    // Refatoração da segunda box C#
                    CustomBox(
                      language: 'C#',
                      text: word!.cSharp,
                      width: size.width * 500,
                    ),

                    // Refatoração da terceira box JAVA

                    CustomBox(
                      language: 'Java',
                      text: word!.java,
                      width: size.width,
                    ),

                    // Refatoração da quarta box SAÍDA DE DADOS
                    CustomBox(
                      language: 'Saída de Dados',
                      text: word!.exit,
                      width: size.width,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
