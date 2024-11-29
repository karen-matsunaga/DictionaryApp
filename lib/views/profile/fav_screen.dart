import 'package:dictionary/controllers/controllers.dart';
import 'package:dictionary/views/views.dart';
import 'package:dictionary/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:dictionary/utils/constants.dart';
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
              final word = words[index];
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
              );
            },
          ),
        ),
      ),
    );
  }
}
