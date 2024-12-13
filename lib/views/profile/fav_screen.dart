import 'package:dictionary/controllers/controllers.dart';
import 'package:dictionary/models/models.dart';
import 'package:dictionary/views/views.dart';
import 'package:dictionary/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class FavoritePage extends StatefulWidget {
  FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  // EXIBIÇÃO DO ID ESPECÍFICO
  var wordName = "";
  Words? word;

  // INICIAR TODA VEZ QUE ACESSAR O APLICATIVO
  @override
  void initState() {
    super.initState();
    Provider.of<WordsProvider>(context, listen: false).loadWords();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = FavoriteProvider.of(context);
    final words = favoriteProvider.words;
    final wordsProvider = Provider.of<WordsProvider>(context).words;

    // LISTA DE TODAS AS PALAVRAS DO ARQUIVO words.json
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // AppBar do aplicativo
      appBar: PreferredSize(
        preferredSize: sized,
        child: CustomAppbarWidget(title: "favoritos"),
      ),

      // Opções do Menu de configurações
      drawer: const MenuPage(),

      // DESIGN dos favoritos
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            // QUANTIDADE DE PALAVRAS ARMAZENADAS NA LISTA words
            itemCount: words.length,
            itemBuilder: (context, int index) {
              // RETORNAR CADA PALAVRA POR MEIO DO INDEX
              var word = words[index];
              // EXPERIMENTO
              // Retornar todos os comandos favoritos salvos no botão de pesquisa
              return ListTile(
                leading: Text(
                  word,
                  style: TextStyle(
                    fontSize: Provider.of<FontSizeConfig>(context).fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Icone para REMOVER a palavra da lista dos FAVORITOS
                // DESIGN DO FUNDO DO BOTÃO
                trailing: IconButton(
                  onPressed: () {
                    // EXCLUSÃO DO ITEM NA LISTA DOS FAVORITOS
                    favoriteProvider.toggleFavorite(word);
                  },
                  // A PALAVRA ADICIONADA AUTOMATICAMENTE É ALOCADA NA LISTA
                  icon: favoriteProvider.isExist(word)
                      ? Icon(
                          Icons.favorite,
                          color: favoriteIcon,
                          size: Provider.of<FontSizeConfig>(context).fontSize,
                        )
                      // QUANDO A PALAVRA É DESMARCADA AUTOMATICAMENTE É REMOVIDA DA LISTA
                      : Icon(Icons.favorite_border,
                          color: favoriteIcon,
                          size: Provider.of<FontSizeConfig>(context).fontSize),
                ),
                onTap: () {
                  for (int i = 0; i < words.length; i++) {
                    String word = words[i];
                    if (word
                        .toLowerCase()
                        .contains(wordsProvider[index].name.toLowerCase())) {
                      Navigator.of(context).pushNamed(
                        '/search',
                        arguments: jsonEncode(wordsProvider[index]),
                      );
                    }
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
