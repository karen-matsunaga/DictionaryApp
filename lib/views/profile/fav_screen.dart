import 'package:dictionary/controllers/favorite_provider.dart';
import 'package:dictionary/controllers/fontsize_provider.dart';
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
          padding: const EdgeInsets.all(20),
          itemCount: words.length,
          itemBuilder: (context, int index) {
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
              trailing: IconButton(
                onPressed: () {
                  // IMPLEMENTAR A EXCLUSÃO DO ITEM NA LISTA DOS FAVORITOS

                  favoriteProvider.toggleFavorite(word);
                },
                icon: favoriteProvider.isExist(word)
                    ? Icon(Icons.favorite,
                        color: Colors.red,
                        size:
                            Provider.of<FontSizeConfig>(context).fontSize * 1.2)
                    : Icon(Icons.favorite_border,
                        size: Provider.of<FontSizeConfig>(context).fontSize *
                            1.2),
              ),
            );
          },
        ),
      ),
    );
  }
}
