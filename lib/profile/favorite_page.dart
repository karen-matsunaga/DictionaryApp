import 'package:dictionary/provider/fontsize_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Lista temporária para a implementação do Banco de Dados
final List<String> palavras = ['Print', 'If', 'Else'];

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: palavras.length,
      itemBuilder: (context, int index) {
        // Retornar todos os comandos favoritos salvos no botão de pesquisa
        return ListTile(
          leading: Text(
            palavras[index],
            style: TextStyle(
              fontSize: Provider.of<FontSizeConfig>(context).fontSize,
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_forever_sharp,
            ),
          ),
        );
      },
    );
  }
}
