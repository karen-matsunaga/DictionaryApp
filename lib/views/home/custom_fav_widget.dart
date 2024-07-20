import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:provider/provider.dart' as provider;
import 'package:flutter/material.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    // ICONE FAVORITO
    return InkWell(
      onTap: () {
        // IMPLEMENTAÇÃO DA LISTA FAVORITA NO BANCO DE DADOS
        // ADICIONAR NOS FAVORITOS
      },

      // DESIGN DO ICONE
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.secondary,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        // TAMANHO DO ICONE
        child: Icon(Icons.favorite_rounded,
            color: Theme.of(context).iconTheme.color,
            size: provider.Provider.of<FontSizeConfig>(context).fontSize),
      ),
    );
  }
}
