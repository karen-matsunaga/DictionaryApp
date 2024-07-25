import 'package:dictionary/controllers/favorite_provider.dart';
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:provider/provider.dart' as provider;
import 'package:dictionary/utils/constants.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = FavoriteProvider.of(context);
    final words = favoriteProvider.words;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // AppBar do aplicativo
      appBar: AppBar(
        // Icone do Menu de configurações
        iconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color,
        ),
        // Nome do aplicativo
        title: Text(
          "favoritos".toUpperCase(),
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
              final word = words[index];
              // Retornar todos os comandos favoritos salvos no botão de pesquisa
              return ListTile(
                leading: Text(
                  word,
                  style: TextStyle(
                    fontSize:
                        provider.Provider.of<FontSizeConfig>(context).fontSize,
                    fontWeight: FontWeight.normal,
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
                          size: provider.Provider.of<FontSizeConfig>(context)
                              .fontSize,
                        )
                      // QUANDO A PALAVRA É DESMARCADA AUTOMATICAMENTE É REMOVIDA DA LISTA
                      : Icon(Icons.favorite_border,
                          color: favoriteIcon,
                          size: provider.Provider.of<FontSizeConfig>(context)
                              .fontSize),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
