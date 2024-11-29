import 'dart:convert';
import 'package:dictionary/controllers/controllers.dart';
import 'package:dictionary/models/models.dart';
import 'package:dictionary/views/views.dart';
import 'package:dictionary/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:dictionary/utils/constants.dart';
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
    Provider.of<WordsProvider>(context, listen: false).loadWords();
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

    // VARIÁVEL appBar customizada
    var appBar = PreferredSize(
      preferredSize: sized,
      child: CustomAppbarWidget(
        title: "",
      ),
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
              // DESCRIÇÃO DETALHADA DAS PALAVRAS
              ListTile(
                // NOME E SINÔNIMOS DA PALAVRA
                title: Text(
                  word!.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Provider.of<FontSizeConfig>(context).fontSize),
                ),

                // DESCRIÇÃO DA PALAVRA
                subtitle: Text(
                  '${word!.description}\nSinônimos: ${word!.synonyms}',
                  style: TextStyle(
                      fontSize: Provider.of<FontSizeConfig>(context).fontSize),
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
                          size: Provider.of<FontSizeConfig>(context).fontSize,
                        )
                      // PALAVRA NÃO ADICIONADA NOS FAVORITOS
                      : Icon(
                          Icons.favorite_border,
                          color: favoriteIcon,
                          size: Provider.of<FontSizeConfig>(context).fontSize,
                        ),
                ),
              ),
              // CÓDIGO DAS PALAVRAS EM SUAS RESPECTIVAS LINGUAGENS DE PROGRAMAÇÃO
              Expanded(
                child: ListView(
                  children: <Widget>[
                    // Refatoração da box Portugol
                    CustomBox(
                        title: 'portugol',
                        code: word!.portugol,
                        width: size.width),

                    // Refatoração da box C#
                    CustomBox(
                        title: 'c#', code: word!.cSharp, width: size.width),

                    // Refatoração da box JAVA
                    CustomBox(
                        title: 'java', code: word!.java, width: size.width),

                    // Refatoração da box PYTHON
                    CustomBox(
                        title: 'python', code: word!.python, width: size.width),

                    // Refatoração da quarta box SAÍDA DE DADOS
                    CustomBox(
                        title: 'saída', code: word!.exit, width: size.width),
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
