import 'package:dictionary/controllers/favorite_provider.dart';
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      appBar: const CustomAppBar(title: "Favoritos"),

      // Opções do Menu de configurações
      drawer: const MenuPage(),

      // DESIGN dos favoritos
      body: SizedBox(
        height: height,
        width: width,
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
                  fontWeight: FontWeight.normal,
                ),
              ),
              // Icone para REMOVER a palavra da lista dos FAVORITOS
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
                child: IconButton(
                  onPressed: () {
                    // EXCLUSÃO DO ITEM NA LISTA DOS FAVORITOS
                    favoriteProvider.toggleFavorite(word);
                  },
                  // A PALAVRA ADICIONADA AUTOMATICAMENTE É ALOCADA NA LISTA
                  icon: favoriteProvider.isExist(word)
                      ? Icon(Icons.favorite,
                          color: favoriteIcon,
                          size: Provider.of<FontSizeConfig>(context).fontSize *
                              1.2)
                      // QUANDO A PALAVRA É DESMARCADA AUTOMATICAMENTE É REMOVIDA DA LISTA
                      : Icon(Icons.favorite_border,
                          color: favoriteIcon,
                          size: Provider.of<FontSizeConfig>(context).fontSize *
                              1.2),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}